---
title: Blogging setup in 2021
layout: post
date: 2021-10-16
---

I don't write much here, but I occasionally write _something_ and have done so for over 15 years
[in various forms](/blogs). For many years I used a self-hosted Wordpress installation. At the
time it was certainly fun to set up, comments were novel, and the interface was easy to use.
But once comments basically became a never ending spam magnet, there was little point in
having a VPS with PHP and MySQL just to serve some HTML. Since 2010 I've bounced around between
various static blogging packages. Pelican, Jekyll, Octopress, Hugo... For a number of years I was using
Hugo and pushing to an S3 bucket.

That worked well, but didn't allow the ability to quickly fix a typo in the GitHub UI and have
everything republished. I _could_ fiddle around with GitHub actions (though they wouldn't arrive until quite a bit
later), but instead I decided to switch back to Jekyll and plain ol' GitHub static page hosting.
For my meager blogging needs it really doesn't matter what software I use. But switching Jekyll lets
me use GitHub to get both the instant-publish I've wanted, and to ditch the S3 bucket completely.

And that's where I'm at. Hello once again, [GitHub Pages](https://pages.github.com/).
