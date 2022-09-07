---
title: Single-App Django Projects
layout: post
---

I've never benefitted from Django's multi-app architecture and find the hijacking of a precious
project name pretty annoying. The details and a remedy are described well in
[Single-App Django Project Anatomy](https://zindilis.com/posts/django-anatomy-for-single-app/).

I've referred to this simple but easily-forgotten process of flattening the Django structure so
many times that I've finally automated the process described therein in a simple script: [django_init](https://gist.github.com/kalafut/42bd31b2fdbf7a225da94e320d3e29ba)
