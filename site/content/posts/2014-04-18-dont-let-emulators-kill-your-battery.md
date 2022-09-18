---
layout: post
title: "Don't let Emulators Kill Your Battery"
date: 2014-04-18T08:32:46-07:00
comments: false
categories: [ android]
---

Few things on my Macbook Pro consume as much power, and make the whole housing heat up, like a running
emulator. I'm doing Android work and an emulator is essential, but I don't like the power sapping side
effects. I could shut it down, but the start-up time is long enough to become a distraction. But I really
don't need to *use* it all the time that it's powered up either.

Here's the solution:

    killall -STOP emulator64-x86
    killall -CONT emulator64-x86

These commands will pause and resume the process instantly. When paused it uses 0% of the CPU. I've now
built up muscle memory so as soon as the emulator activity is done, I CMD-Tab,Up,ENT and pause it.

To get fewer 3rd degree burns and run longer than 7 minutes on battery, give it a try.
