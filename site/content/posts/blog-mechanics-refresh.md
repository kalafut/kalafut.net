---
title: Blog mechanics refresh
date: 2026-08-29T23:54:40.928Z
draft: false
bearID: 2C3393DD-AC57-4AD0-AAB5-5DFB475E7AD0
---
Test post following a couple of changes to blog publishing:

1. The content can now come from [Bear](http://bear.app/). I got tired of NetlifyCMS, and find that Bear is the most convenient place to quickly put down some thoughts, so I wrote a small tool to pull `#blog`tagged notes from Bear and add them to my blog repo.
2. Hosting is moved away from Netlify, too. Too many services. Now I have a Github action build the site and push the static files to Cloudflare Pages, which was already being used for other things.

Here’s hoping this makes it a little more likely that I’ll add more regularly!
