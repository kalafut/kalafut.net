---
title: Staticizing WordPress
layout: post
date: 2016-05-21
---

I'm very happy to have just ticked off a really old to-do. I converted three old WordPress blogs to static
sites:

- [NZ Life](http://nz.kalafut.net) (2005--2007)
- [Peoria Dispatch](http://pd.kalafut.net) (2008--2010)
- [Peoria Dispatch (Garden)](http://pdg.kalafut.net) (2009--2010)

These sites aren't just old, they're in read-only mode and are virtually never visited by me nor
anyone else. They are also precious. They capture their respective periods better than photographs
alone, and I didn't want to import or modernize them, since the design is an important part of the
capture. They look today basically the same as they did 10 years ago. But I also didn't want them
sitting atop a complex, self-hosted WordPress installation. Having the content wrapped up in a MySQL
database and accompanying folder structure, and requiring a functioning WP installation to even get
to the posts, was terribly fragile. Remember: no one is going to these sites, so if they fail
somehow it might be too late before anything is noticed. I was amazed they even worked, and that I
could log in.

They were liberated last night courtesy of [this wget
invokation](https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/):

``` bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent -e robots=off http://example.org
```

There was a tiny bit of prep, mainly to make sure everything lived under the proper subdomain, but
that was about it. After `wget` was done, I was left with a folder of .html files that faithfully
represented the look and content of the site. Magic! I'm truly impressed at how well links were
converted. Even things like shown/hidden comment sections that I thought might trip it up came
through just fine.

With files in hand, it was straightforward to upload everything S3 and change over the DNS. Now the
sites are fast, secure, and not on my server.
