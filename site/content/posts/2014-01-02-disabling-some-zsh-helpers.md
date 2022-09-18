---
layout: post
title: "Disabling some zsh helpers"
date: 2014-01-02T19:50:01-08:00
comments: false
categories: [ zsh cli]
---

Two zsh features that are usually helpful but sometimes not: globbing, and autocorrect.
They're easily disabled or restricted.

Globbing can be a nuisance with some commands. For example, Octopress offers a host
of useful rake tasks such as:

    rake new_post["Disabling some zsh helpers"]

zsh will apply expansion rules to this command causing it to fail. To disable globbing for a single command,
prefix with it `noglob`. Or make an alias for a command you never want to use with globbing:

    rake='noglob rake'

Similarly, zsh autocorrect can be a source of annoying confirmation prompts for valid
commands. Disable it entirely with `unsetopt correct_all`, or alias a single command:

    alias git='nocorrect git'
