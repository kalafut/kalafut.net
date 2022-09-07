---
title: WWV Simulator
layout: post
date: 2019-02-12
---

I just released my [WWV Simulator](https://wwv.mcodes.org/) to the wild. This is something I've
toyed with making for a long time, but the threat of WWV and WWH
[being shut down](https://www.voanews.com/a/time-may-be-running-out-for-millions-of-clocks/4554376.html)
really spurred me into action. It was a fun project that had a number of unexpected chances to learn stuff:

- I learned more about Javascript audio than I ever expected. I thought I could simply play some clips using HTML 5 APIs, and that's what I originally built, but then I found that it didn't really work at all on mobile and had to basically rebuild the whole
thing using an audio library.
- My original strategy of just pasting together audio clips didn't work out because of the seconds pulses
  being overlaid at random places. This prompted writing a program to generate the pulses myself, remove them
  from the original clips, and then overlays the recorded and synthesized audio.
- The complexity of the broadcast schedule was much greater than I thought.
- It was a great excuse to try out flexbox.

Most importantly, it's done! These little projects are fun but they do need to wrap up properly, either being officially
shelved or published, lest they nag at you for continual tweaks. At 7am this morning I [posted the thing to
Hacker News](https://news.ycombinator.com/item?id=19144003) and can now be done with it!
