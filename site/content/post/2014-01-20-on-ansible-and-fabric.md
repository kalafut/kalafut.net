---
layout: post
title: "On Ansible and Fabric"
date: 2014-01-20
comments: false
categories: [ ansible fabric deployment]
---

It's very easy for me to become paralyzed by the pursuit of a "best practice". In some cases there
isn't much risk. Coding conventions, for example. When the world has decided that `===` is better than
`==` most of the time in Javascript, I'm happy to go along with it. But other areas are trickier. I
can easily get really caught up in web framework and database choices. Another area is deployment,
but I've recently had an epiphany that I'll decribe.

I recall seeing a talk at DjangoCon about deployment with Chef and one bit that stuck in my mind was
how he portrayed configuration management systems ([Chef](http://www.getchef.com/chef/),
[Puppet](http://puppetlabs.com/), [Ansible](http://www.ansibleworks.com/), etc.) as pretty much *the*
way to responsibly provision and deploy. To do anything less was reckless, and he called out
[Fabric](http://fabfile.org) as a utility that one should remove from the tool box.

I think he's right and wrong, and it depends largely on the circumstance. Here's how I see deployments
scenarios in increasing sophistication:

0. No structure, no repeatability. Just SSH into a box and do whatever. Get files there however.
1. Organized chaos. Maybe some helper scripts to make certain aspects repeatable. Still a lot of
   work done right on the remote.
2. Remote control. Using a tool like Fabric to script repeatable interactions with the remote box.
   This means much less random stuff being done in a remote shell, and those things that are happening
   are part of source control (e.g. fabfile.py)
3. Automation. Enter the likes of Puppet, Chef, Salt Stack, Ansible. Sophisticated, turn-key provisioning
   and deployment across lots of machines.
4. ???  More complicated than I'll ever deal with.

After the DjangoCon talk I was compelled to try to play at level 3 exclusively. It partially
worked. After trying a number of solutions I settled on Ansible for VPS provisioning and without
a doubt saw real benefits. For me, things like setting up a new VPS are doable but time consuming
and error prone. Ansible is designed for this sort of task, and there are plenty of playbooks
available to get a new VPS instance most of the way there, which I've then modified to suit my tasks. Once things are
working well, there isn't much need to regularly touch those playbooks.

But application deployment on Ansible has been trickier. I've read quite a bit about why I can and should
be using Ansible for that portion as well, but I find that setting up that solution is way clunkier
than my simple Fabric scripts, and I don't see the benefit for me. I'm a one-man band pushing up very
small projects. For me the enemies are time and complexity, not issues of scale and dealing with
many developers. A simple Fabric script is easier to understand and runs fast. My attempts at
Ansible-based approaches were a pain to develop and test, and ultimately ran slower.

I think the litmus test for tasks in my projects will be:

   - if it relates to instance configuration and is not strongly tied to any app, use __Ansible__
   - if it relates to deploying, configuring and controlling an app, use __Fabric__

