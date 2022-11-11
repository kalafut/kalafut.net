---
title: Sherwood Sports
date: 2022-11-11T17:08:12.176Z
draft: true
---
Last month I released/announced [Sherwood Sports](https://sherwoodsports.org). This was one of those simple ideas I'd thought about for a while, finally got going with assuming it would be hours or a few days, and ended up spending at least a couple of weeks on. It took some deliberate effort to actually ship it and not continue fiddling indefinitely.

In this case "shipping" meant announcing the existence of the site on a local Facebook group. I don't much care for Facebook but there are a couple of things for which it is the only optional, and easily getting the word our to our little town is one of them.

The reaction was pretty swift and uniformly positive. Lots of people commented on the need for such a site, and I also received plenty of additions and correction to the data itself, which is exactly the sort of crowdsourcing I was hoping for. Someone on the city council even reached out to ask about whether they could highlight it at an upcoming meetings. Sure! Go for it! I've never knowns such fame.

One comment about the site was interest and reaffirmed my initial motivation for making it. This personal was involved with one of the local sports organizations and was saying how they was to make a new association of such clubs so they could align on things like common (and not crappy) web properties for these sports clubs. I responded politely, but I was actually think that my kids will probably be graduating college before such a thing comes to fruition. The idea of getting a bunch of disparate orgs to the table for something like this sounds tedious and highly likely to fizzle out. Which is why it is so motivating that tools and services are so available for a very mediocre website build like me to just build a think comparatively quickly.

The tech behind the site was fun to work with. I started with React but landed on Svelte. It is a joy to use, even as a newbie. And I opted to just bake all of the data into the source which make the "stack" extremely simple. The whole thing is built with GitHub Actions and and served from GitHub. No databases, no servers. Wonderful.

