---
layout: post
title: "Chromecast and IGMP"
date: 2014-05-16T23:01:54-07:00
comments: false
categories: [ ]
---
I bought a Chromecast shortly after it debut and enjoyed months of great service. Lately I've been
suffering through months of crappy service, and have spent a lot of time troubleshooting the thing.

The main symptom: the Chromecast icon would drop off of apps shortly after connecting to them. This
was only occuring when I had the device plugged into the TV for some reason.

There are a *lot* of Chromecast support forums and I tried a ton of stuff the resulting in no change,
or a moment of hope followed by disappointment. Tonight I was reading an ASUS forum and just started
messing around with router settings on my RT-N56U and found that turning off the 5Ghz radio and turning
on "IGMP Snooping" for 2.4GHz has dramatically improved the stability of the connection.

I have no idea about:

* Whether this will last
* What IGMP really is
* Whether I can turn 5GHZ back on (but I don't use it anyway and have spent enough time on this)

But things are performing better than they have in a long time. I have updated my router firmware
since getting the Chromecast, so it's very plausible that one of those updates is the root cause of
my struggles. In any case, I'm happy tonight.

__Update__

Searches about IGMP and Chromecast showed a lot advice telling people to try turning the option
*Off*.  I guess the only thing that I'm sure of is that it's worth twiddling this settings as part
your Chromecast troubleshooting process.
