---
title: Fossil to git
layout: post
date: 2016-01-24
draft: false
---
A while back I [dabbled with Fossil SCM](/posts/2015-01-29-fossil-1). I liked parts of it but ended up returning to git. During that experiment,
I created a fair bit of content in Fossil and wanted to get it out. I assumed this would be easy because I'd
used the Fossil `export` command previously to create a `git-fast-import`-compatible text file with all of the
repo contents. This time, however, I was met with this error upon import:

`fast-import error: fatal: mark :685 not declared`

Disappointing. But the fast-import format is plain text so I decided to take a look at a bazillion lines in
Vim. Even without any knowledge of the format, it was easy to grok what was going on. A key concept was that
"marks" were being defined and referred to later. But mark :685 was being referenced before it was ever created,
which is presumably a bug in Fossil.

I just moved the whole mark :685 section to the top of the file, reran `git-fast-import`, and everything worked!
