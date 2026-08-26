# kalafut.net

Personal site and blog, built with [Hugo](https://gohugo.io) using a vendored fork
of the [Coder](https://github.com/luizdepra/hugo-coder) theme.

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
