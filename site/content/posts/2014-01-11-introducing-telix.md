---
layout: post
title: "Introducing Telix"
date: 2014-01-11T13:22:41-08:00
comments: false
categories: [ Telix]
---

A few months ago I started a side project. A few days ago I actually got the thing working
in the most basic ways. It is a web application and I plan to launch it as a low cost (but > $0) service.
I have a lot more work ahead of me and plan to chronicle issues here. I'm keeping the details wrapped up for the time
being, but I'll say this much:

- I plan a web app only (no native clients)
- There will be a fairly heavy JS client. Right now that is written in [ Backbone ](http://backbonejs.org/), but I'm
  currently evaluating a shift to [ AngularJS ](http://angularjs.org/).
- There's significant server-side component. I'm writing it in NodeJS atop MySQL (today) or
  perhaps Postgres if there is a good reason to move. There is also a fair bit of processing
  outside of the webapp processes that will be done in Python.
- I've never used [redis](http://redis.io), but is looks like it could fit well into this project to alleviated
  the write-pounding on the database

The working name for the project is "Telix", a throwback to some of my earliest hacking days when I lived within the [Telix](http://en.wikipedia.org/wiki/Telix) dial-up program (last stable release, 17 years ago ;-).
