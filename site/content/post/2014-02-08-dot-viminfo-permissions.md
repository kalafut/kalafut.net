---
layout: post
title: ".viminfo permissions"
date: 2014-02-08T15:48:36-08:00
comments: false
categories: [ vim]
---

I wondered why my Vim command history wasn't being preserved between sessions.

Root cause: `~/.viminfo`, for whatever
reason, was owned by root. I deleted it, restarted Vim, and all is now good.
