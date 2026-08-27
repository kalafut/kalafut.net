# kalafut.net

Personal site and blog, built with [Hugo](https://gohugo.io) using a vendored fork
of the [Coder](https://github.com/luizdepra/hugo-coder) theme.

Hosted on Cloudflare Workers as an assets-only Worker. GitHub Actions builds
on every push to `main` and hands the output to `wrangler`; GitHub does not
serve any traffic.

## Requirements

Hugo **extended** (the theme compiles SCSS via Hugo Pipes, so the standard build
will not work). Pinned version: see `.hugo-version`.

```
brew install hugo
```

## Local development

```
hugo server -s site         # http://localhost:1313, with LiveReload
hugo server -s site -D -F   # include drafts and future-dated posts
```

Build:

```
hugo -s site -d ../dist
```

## Theme

The theme lives at `site/themes/hugo-coder-custom/` as ordinary files in this
repo (it used to be a git submodule). Edit it in place; changes show up
immediately under `hugo server`. There is nothing to commit separately and no
asset cache to regenerate by hand — `resources/_gen/` is gitignored and rebuilt
on every run.

## Content

Posts are in `site/content/posts/`, standalone pages in `site/content/page/`.

`dateify.py` backfills a `date:` field into front matter from the filename.

## Deployment

`.github/workflows/deploy.yml` runs on every push to `main` (and via
`workflow_dispatch`). It installs the pinned Hugo, builds, and runs
`wrangler deploy`. Takes about 25 seconds.

It needs two repo secrets: `CLOUDFLARE_API_TOKEN` (scoped to Workers Scripts:
Edit) and `CLOUDFLARE_ACCOUNT_ID`.

`wrangler.toml` binds the Worker to `kalafut.net`. Cloudflare owns that DNS
record — do not add A/AAAA records for the apex by hand, or wrangler will
refuse to manage the custom domain.

`www.kalafut.net` is a proxied CNAME plus a Cloudflare **page rule** that
forwards `www.kalafut.net/*` to `https://kalafut.net/$1`. The redirect happens
at Cloudflare's edge, so `www` never reaches the Worker. A second page rule
forces HTTPS on the apex.

`site/static/_headers` sets cache policy. Hugo Pipes fingerprints css/js, so
those are `immutable`; everything else revalidates.

To deploy by hand: `npx wrangler deploy` (after `npx wrangler login`).
