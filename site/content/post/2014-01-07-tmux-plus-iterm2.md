---
layout: post
title: "tmux + iterm2"
date: 2014-01-07T21:34:40-08:00
comments: false
categories: [ [ "tools", "tmux", "iterm2" ]]
---

Both [tmux](http://tmux.sourceforge.net/) and [iterm2 ](http://www.iterm2.com/) are great, but the default interaction will have iterm
scrolling your entire tmux window off the screen which is probably not what you
want. To use iterm's scrolling within tmux, visit `Preferences -> Profiles -> Terminal` and check:

>Save lines to scrollback when an app status bar is present

Thanks to [Dan Carley](http://dan.carley.co/blog/2013/01/11/tmux-scrollback-with-iterm2/) for this tip.
