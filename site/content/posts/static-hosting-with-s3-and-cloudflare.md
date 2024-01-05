---
title: Static Hosting with S3 and Cloudflare
date: 2024-01-05T16:43:00.614Z
draft: false
---
I've used both AWS S3 and Cloudflare for a long time, often to deliver simple static hosting with a TLS posture. 99.9% of the time I'm just updating the content, but every few years I need to set up a brand new domain, and this gives me angst.

The issue is that I always recall there being a hangup with root domains, and there are too many articles out there that make this more complicated than it needs to be. My goal is almost always to deliver something on `https://mysite.com`, not `https://www.mysite.com`. It isn't 2000 anymore. But countless blog posts will tell you one or more of:

* Setting up a CNAME for a root/apex domain can't be done. (Generally true, but keep reading)
* You should set up multiple buckets and set one to redirect.
* Maybe move your domains to Route 53 and use an ALIAS record.

But if you're on Cloudflare, it is much simpler. First, you create the usual S3 bucket, specifying your **root** domain as your bucket name. Then, thanks to the magic of CNAME flattening that Cloudflare [introduced nearly 10 years ago](https://blog.cloudflare.com/introducing-cname-flattening-rfc-compliant-cnames-at-a-domains-root/), you can just add a CNAME record for your root domain and it will all work—no multiple buckets or redirects.

Blogs that talk specifically about S3 + Cloudflare often don't explain this. Even [Cloudflare's own docs](https://developers.cloudflare.com/support/third-party-software/others/configuring-an-amazon-web-services-static-site-to-use-cloudflare/#task-2---set-up-an-s3-bucket-for-a-apex-domain) about setting up a static site on S3 don't make this clear. It is really easy, and has been for a decade. I hope future me remembers to search for this post.