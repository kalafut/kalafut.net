# Notes

### Local Development

* Added `local_backend: true` to `site/static/admin/config.yml`
* To use the Hugo server for serving blog/theme changes, run `hugo server` from `site` and visit http://localhost:1313. This doesn't include any netlify-cms capabilities but *does* allow LiveReload, which is really handy.
* For a local version of the full netlify-cms:
  * Use `npm start` to:
    * Build the site
    * Watch for changes and rebuild
    * Handle requests at http://localhost:3000
  * In a separate terminal start `npx netlify-cms-proxy-server`. Without this the admin login process won't work.
  * Use http://localhost:3000/admin to access the netlify-cms UI. A password shouldn't be required.
* "Publish" when local will create local files but does nothing with git or GitHub. A git commit and push is required to actually publish the updates.
* I'm not sure, but it seemed like after some config or theme file updates I needed to restart things for everything to take effect?



---

# Hugo template for Netlify CMS with Netlify Identity

This is a small business template built with [Hugo](https://gohugo.io) and [Netlify CMS](https://github.com/netlify/netlify-cms), designed and developed by [Darin Dimitroff](https://twitter.com/deezel), [spacefarm.digital](https://www.spacefarm.digital).

## Getting started

Use our deploy button to get your own copy of the repository. 

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/netlify-templates/one-click-hugo-cms&stack=cms)

This will setup everything needed for running the CMS:

* A new repository in your GitHub account with the code
* Full Continuous Deployment to Netlify's global CDN network
* Control users and access with Netlify Identity
* Manage content with Netlify CMS

Once the initial build finishes, you can invite yourself as a user. Go to the Identity tab in your new site, click "Invite" and send yourself an invite.

Now you're all set, and you can start editing content!

## Local Development

Clone this repository, and run `yarn` or `npm install` from the new folder to install all required dependencies.

Then start the development server with `yarn start` or `npm start`.

## Layouts

The template is based on small, content-agnostic partials that can be mixed and matched. The pre-built pages showcase just a few of the possible combinations. Refer to the `site/layouts/partials` folder for all available partials.

Use Hugo’s `dict` functionality to feed content into partials and avoid repeating yourself and creating discrepancies.

## CSS

The template uses a custom fork of Tachyons and PostCSS with cssnext and cssnano. To customize the template for your brand, refer to `src/css/imports/_variables.css` where most of the important global variables like colors and spacing are stored.

## SVG

All SVG icons stored in `site/static/img/icons` are automatically optimized with SVGO (gulp-svgmin) and concatenated into a single SVG sprite stored as a a partial called `svg.html`. Make sure you use consistent icons in terms of viewport and art direction for optimal results. Refer to an SVG via the `<use>` tag like so:

```
<svg width="16px" height="16px" class="db">
  <use xlink:href="#SVG-ID"></use>
</svg>
```
