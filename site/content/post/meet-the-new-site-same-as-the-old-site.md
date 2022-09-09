---
title: Meet the New Site, Same As the Old Site
date: 2022-09-09T16:12:14.572Z
draft: false
---
While it may look the same, everything to build and deliver this site has changed. Here's a look at what and why.

I wrote about [my blogging setup](/post/2021-10-16-blogging-setup) roughly a year ago, and in that post a couple of key motivations for the move to GitHub were:

* Get away from relying on building on Mac and pushing to S3
* Leverage the GitHub UI for small edits

There were benefits from the change, but not to the extent I was hoping. For example, say I was out somewhere, took an interesting photo, and wanted to author a brief post with that picture. Doing that without a laptop is not easy. How do I upload the image via the GitHub UI, for example? And then I need to remember where assets go and the correct Markdown syntax to reference the file (which is probably some UUID name). This all felt like way more friction than my WordPress experience 15 years ago.

I was also not satisfied with the local development story. Jekyll is fine (if slow), but I don't want to mess with this or that version of Ruby and Gems in my environment. I want a docker image. But, as far as I can tell, there isn't an official one that matched what GitHub Pages will use to build your site, and I ran into incompatibilities with stock Jekyll images. I did find a useable [third party image](https://github.com/Starefossen/docker-github-pages) but it was annoying to not have an offical one from GitHub.

### Enter Netlify CMS

When I discovered [Netlify CMS](https://www.netlifycms.org/) and I became really jealous and eventually motivated to change the entire pipeline. Now my authoring experience can be raw Markdown edited however I want, but it can also be:

![](/img/netlifycms.jpg)

I can easily add images again! Note that this is still a static site, not a hosted blogging service nor system I'm running. The nice UI is entirely client side and accessible from my site. Edits result in commits on GitHub.  Netlify builds and publishes from GitHub automatically.  [Netlify Identity](https://docs.netlify.com/visitor-access/identity/) is used to control access to the UI and build process. This is all pretty quick to set up fits well within the Netlify free tier.

Cool, eh?

### Hello Again, Hugo

One of the boilerplate implementations for this setup was [based on Hugo](https://github.com/netlify-templates/one-click-hugo-cms), so I also used the opportunity to switch back to that. I'm not too particular about which blogging engine I use as long as it is stable, but I'm definitely re-enjoying Hugo's speed. Saving and seeing a LiveReload in my browser 100ms later is quite nice when doing any work on the site design.

### Will It Stick?

Hopefully. The big unknown is Netlify. I've not use them before, so I'm going to find out how well they work as a host compared to the rock solid experience with both S3 and GitHub Pages. A secondary concern is Netlify CMS and Netlify Identity. The [CMS project](https://github.com/netlify/netlify-cms) seems a little sluggish, with lots of open issues and PR but the last commit almost 4 months ago. Not a huge deal, but if there are security issues or critical bugs I might quickly become less comfortable with this setup. Similarly if the Identity service were to become rolled into a Pro plan, it would give me pause to pay out *just* for that feature which I'd only occasionally use.