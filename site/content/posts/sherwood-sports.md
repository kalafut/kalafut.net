---
title: Sherwood Sports
date: 2022-11-11T17:08:12.176Z
draft: false
---
Last month I released/announced [Sherwood Sports](https://sherwoodsports.org). This was one of those simple ideas I'd thought about for a while, finally got going with assuming it would take hours or a few days, and ended up spending at least a couple of weeks on. It took some deliberate effort to actually ship it and not continue fiddling indefinitely.

In this case "shipping" meant announcing the existence of the site on a local Facebook group. I don't much care for Facebook nor use it often, but there are a couple of things for which it is the only option, and easily getting the word out to our little town is one of them.

The reaction was pretty swift and uniformly positive. Lots of people commented on the need for such a site, and I also received plenty of additions and correction to the data itself, which is exactly the sort of crowdsourcing I was hoping for. Someone on the city council even reached out to ask about whether they could highlight it at an upcoming meeting. Sure! Go for it! I've never known such fame.

One comment about the site was interesting and reaffirmed my initial motivation for making it. This person was involved with one of the local sports organizations and was saying how they wanted to make a new association of such clubs so they could align on things like this and make common (and not crappy) web properties for these sports clubs. I responded politely, but I was actually thinking that my kids will probably be graduating college before such a thing comes to fruition. The idea of getting a bunch of disparate orgs to the table for something like this sounds tedious, time consuming and highly likely to fizzle out. I feel enormous leverage being one person who can just decide to ship a thing, rapidly, without approvals or consensus from anyone.

The tech behind the site was fun to work with. I started with React but landed on [Svelte](https://svelte.dev). It is a joy to use, even as a newbie. And I opted to just bake all of the data into the source which made the "stack" extremely simple. The whole thing is built with GitHub Actions and and served from GitHub. No databases, no servers. Wonderful.

I'm definitely weakest at UI when it comes to almost any of these project. I very briefly flirted with using the project to try [Tailwind](https://tailwindcss.com) and quickly realized it was beyond what I wanted to spend time learning. So back to plain ol' [Bootstrap](https://getbootstrap.com). I'm pretty sure folks who are looking looking for what this site provides couldn't care less if the appearance is pretty generic.

Overall, I'm happy with the site and reception. It has been a while since one of the projects got some traction, and using Svelte in earnest was a delight and definitely worth spending time on.

Next project... tbd. 
