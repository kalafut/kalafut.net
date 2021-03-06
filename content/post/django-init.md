+++
title = "Single-App Django Projects"
date = "2017-08-06T08:55:08-07:00"
draft = false
type = "post"
+++

I've never benefitted from Django's multi-app architecture and find the hijacking of a precious
project name pretty annoying. The details and a remedy are described well in
[Single-App Django Project Anatomy](https://zindilis.com/blog/2017/01/06/django-anatomy-for-single-app.html).

I've referred to this simple but easily-forgotten process of flattening the Django structure so
many times that I've finally automated the process described therein in a simple script: [django_init](https://gist.github.com/kalafut/42bd31b2fdbf7a225da94e320d3e29ba)
