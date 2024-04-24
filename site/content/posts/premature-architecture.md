---
title: Premature Architecture
date: 2024-04-24T17:47:54.247Z
draft: false
---
A few months ago, I started learning Flutter to build an app I'd been thinking about for a while. I joined the various Flutter-centric communities and followed developers who were active in the space. Overall, I've thoroughly enjoyed both the framework and the community dialog. But one element jumped out right away: a tremendous amount of material put out, both in social media and spammy Medium posts, bikeshedding over what I considered very "big software" topics like architecture. I was taken aback since most of the software to be built is a mobile app, and often by a single developer. Whatever gets people over the finish line is what these folks need, so all this Architecture discussion seems like quite a distraction. There has been some pushback, for example, this excellent tweet thread:

https://x.com/peteralexbizjak/status/1783015772463263938

*(Apologies to those without a Twitter account who can't view the thread. Thanks Elon.)*

First, a little history about how I was first introduced to programming.

### Foundations

We got our first computer in 1986, and it looked like this:


![](img/att_6300.png)

Sitting at a DOS prompt and then starting [GW-BASIC](https://en.wikipedia.org/wiki/GW-BASIC) was pretty much how everything began for me for quite a while. I just wanted to make the computer do things (like, for example, drawing a line on the screen), and the resources I had were the inscrutable system manuals (the binders to the left), one book from [B. Dalton](https://en.wikipedia.org/wiki/B._Dalton), and a lot of time as a kid. Importantly, I *didn't* have the entire internet telling me the right way, best practices, don't do that, OMG did you really just, etc. etc. I just wrote code however the hell I wanted until the program worked like I thought it should. The code was just a means to an end, which was a working program.

As I progressed, got a modem and access to more material, and got some more books, I started learning some valuable CS ideas that undoubtedly helped. These were important because they usually made the program run better (e.g., don't read from floppy so much, *cache* some data!). I don't even think I cared much about using `goto`, and I liberally used global variables since I'd no reason to not use them, and I definitely didn't even know the word "Architecture" applied to software. But the programs got written, they worked, and I had a ton of fun. Fun is important, by the way! When we give a kid a bucket of Legos we don't also say, "Here are the best practices for assembling these. Please build Legos this way."  We just encourage them to build.

### Premature Architecture

Back to Flutter. When I started seeing big discussions about architecture (Service Oriented Architecture, Domain Driven Design, Clean, etc.), I was surprised because those are things I'd associated with large systems being maintained by many people. Uncle Bob agrees:

> The goal of software architecture is to minimize the human resources required to build and maintain the required system.

When a group of people, especially a large group with people coming and going, needs to collaborate on a project, the coordination and integration of their work becomes a dominant factor, and architectures can help provide useful guardrails. But what about the solo developer (or tiny team) building a mobile app?

 When I learned about the [Small-angle approximation](https://en.wikipedia.org/wiki/Small-angle_approximation) the concept had a lasting impact. In short, for small angles, *sin θ ≈ θ*. This was math saying, "Eh, good enough."  You can find many similar "for small n..." type arguments, and I think most of us (myself included!) don't heed them enough. If we're talking about a solo developer building a mobile app, we can comfortably start with that being a "small n" situation.

 Back to Uncle Bob, we're already talking about minimal developers, so unless the architecture-focused work helps that person sufficiently, it is probably not worth the effort. Similarly, the maintenance of a mobile app by one person is likely not going to be significantly impacted by an architecture choice since *most* apps–if they ever ship–will only see minor bug fixes. Folks aren't going to replace a working database in their working app just for fun, and having an elaborate data store abstraction probably won't justify the development cost. Just get the thing built, and remember, all those architecture decisions are compiled away, and the end user only cares if your app works.

### It's all tradeoffs

This cavalier approach is all good, but what about the real world, with companies, interviews, existing code bases, and all that? Of course, you have to adjust to the situation presented. If you want to get a job in places that demand fluency in design patterns and enterprise architecture, then you have to be able to deliver on that, both to get the job and because it probably makes sense in that environment. You should follow an existing code base's design, which may mean learning how these architectures work.

Likewise, if you *enjoy* the elements of architecture and derive joy from your code being structured just so, then by all means, go for it! I, for example, really got into OO-programming and thoroughly enjoyed trying to leverage patterns from "[Gang of Four](https://en.wikipedia.org/wiki/Design_Patterns)" book. The problems arise when:

* you're not producing because you're spending your time reading Medium articles and are paralyzed trying to pick a state management solution
* you're telling others that they're wrong/less capable because they made a different choice

If you're getting started and want to build an app, just get it built however you can. Your #1 enemy is losing momentum, so make progress first and foremost. (No extra points will be awarded if it looks like [Enterprise Fizz Buzz](https://github.com/EnterpriseQualityCoding/FizzBuzzEnterpriseEdition).)

And remember... right now, somewhere, someone is getting paid to ship spaghetti code using jQuery v1, without tests. It will enter the world and probably work fine.