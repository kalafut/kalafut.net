---
layout: post
title: "Determine a unique selector with Firefox"
date: 2014-01-01T10:09:26-08:00
comments: false
categories: [ firefox splinter]
---

I use [splinter](http://splinter.cobrateam.info/) to automate downloading information from banks and
brokerages. It works well. Those sites are usual horribly designed, outdated, and a royal pain to navigate.
Suffering through the one-time process of developing a script to automated dealing with them is well worth it.

Usually the script development is simply done by inspecting DOM element ids or names. But some of these bank
sites are so bad, you're left with trying to send a click event to an image buried in a table with little in
the way of navigation helpers. In this case, Firefox's __Copy Unique Selector__ works well.  Just inspect the
element and access the function via the dropdown:

![Firefox Selector](/img/firefox_selector.png)

This will give you something like:

    .bg8 > td:nth-child(3) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(11) > td:nth-child(2) > input:nth-child(1)

With this I can use [browser.find_by_css()](http://splinter.cobrateam.info/docs/api/driver-and-element-api.html#splinter.driver.DriverAPI.find_by_css) to access the element.

Super ugly, yes, but when the source you're working with is ancient and has virtually no identifiers to hook
into, it may be the simplest approach.
