---
title: Fossil SCM (again)
date: 2024-04-25T18:48:38.440Z
draft: false
---
I’ve been intrigued by [Fossil SCM](https://fossil-scm.org) and have written about it a couple of times ([2016](https://kalafut.net/posts/2016-01-24-git-fast-import/), [2015](https://kalafut.net/posts/2015-01-29-fossil-1/)). The idea of a bundled solution for source control, ticketing, UI, etc., is appealing, so I’ve wanted to find a good opportunity to use Fossil in earnest. Plus, I'm a big SQLite fan, and that is inextricably linked to Fossil both as the storage subsystem, and that they're from the same team.

Late last year, I had the perfect project for it. Because it was going to be a closed source, there were none of the issues associated with it not being on GitHub. Furthermore, it was a good-sized project involving both a backend server component and a mobile app, and would benefit from consolidated management of source and project materials. It had been about 8 years since I last took a look at Fossil, and I was eager to see how it had changed.

The experiment lasted two months, and then I switched to git. While I say "experiment," the project began in Fossil and would have stayed there if Fossil had met all of my needs. Unfortunately, many issues remain that, taken together, keep me from using Fossil as my primary SCM tool.

I’ve itemized several pros and cons below,  But it is worth highlighting that a number of the issues I ran into stem from Fossil's extreme view that [history should be immutable](https://fossil-scm.org/home/doc/trunk/www/fossil-v-git.wiki#history).  They even foreshadow the impact:

>Fossil, in contrast, puts more emphasis on recording exactly what happened, including all of the messy errors, dead-ends, experimental branches, and so forth. One might argue that this makes the history of a Fossil project "messy," but another point of view is that this makes the history "accurate." In actual practice, the superior reporting tools available in Fossil mean that this incidental mess is not a factor.

I think the mess is a factor and results in a tool with poorer UX. This is unfortunate, since there is no reason why there couldn’t be flexibility there which could be controlled by the user. However, the Fossil team has established its position, and I think the implications of that have hurt the widespread adoption of the tool.

## Detailed Findings

Here are some of the key pros and cons that I noted while using Fossil, sorted roughly in order from most to least important. When assessing Fossil, my baseline was always `git`, or a reasonable alternative to one of the features that Fossil is providing, for example, a UI or ticketing system.
#### Pros
- Most of the basic source control functionality that I use every day in `git` is present in Fossil and behaves as I would expect. It didn’t require much study or relearning to get rolling with it.
- I really like the simplicity of the `fossil sync` command. I’m comfortable with and understand the way pushing and pulling branches and tags in `git` works, but for most cases, I appreciated just being able to lean on `sync` and know that all information was transferred either up or down, which is almost always what I wanted for my personal projects.
- The ticketing system was a big draw for me and mostly works OK. There are some clunky aspects to it, though. But there is also immense flexibility (it is literally an SQLite table you can mess with), so you can usually work around them if you’re willing to write some SQL or CLI commands. 
- The built-in UI is pretty good, at least for inspecting and `diff`-ing the repository. I used it a lot, but then again, I had to use it because nothing else would view a Fossil repo!
- The built-in wiki is also pretty good. There are a couple of annoyances that I note below, but overall it was very usable and what I would expect from a markdown-based wiki.
- I played around with the chat and forum functionality, and they seemed basic but workable. Since I had no actual use, I can’t say much more than that.

#### Cons
- You can’t edit or delete ticket comments, which are the main content of a ticket. This makes the resulting tickets potentially messy. If I have some inaccuracies in a long comment, the only thing I can do is append a fixed version of the comment, resulting in two nearly identical comments. This is an example where the rigid immutability hurts, because I would really like just to be able to delete a comment.
- Also due to immutability is how extremely tedious it is to recover if you accidentally check in files you didn’t mean to. In my case, I’d accidentally added a folder with binaries, which bloated the repo's size. Even though I noticed this immediately and hadn’t done any sort of sync, there is no easy way to get that stuff out. Fossil has this awkward, hyper-specific "shun" feature to block specific objects from syncing, but I actually ended up pulling a time machine back up from slightly earlier and restarting because I was so annoyed trying to clean the repo. 
- Beyond the comment issue, there is some clunkiness to the ticketing system, such as not being able to unset a field that you previously set. Optional tags, for example, would default to empty/NULL, which is great, but if you set them to anything else, you can’t clear them back to NULL. It is possible to paper over some of these issues via the CLI tool, but it gets cumbersome. For example, here is how I managed to rename a field choice from "Medium" to "B":
```bash
f tick sho 0 | cut -f 2,8 | grep Medium | cut -f 1 | xargs -I {} fossil ticket set {} priority "B"
```

While I appreciate having the power to do this, I prefer that Fossil would just let me change it in the UI, like most tools. 
- The UI was nice for viewing, but I really miss being able to do SCM operations directly against it. I’m a long-time user of [GitUp](https://gitup.co/) and prefer a GUI when I’m trying to clean up commit metadata, or rearrange commits.
- I miss git's staging area. Sometimes the lack of staging area is touted as a Fossil advantage because it is simpler. But over the years, I’ve become very used to leaning on the staging area as a way to structure multiple commits, and also to clean up messy work in progress.
- Most of the file operations behave as expected, there is some annoying weirdness with renaming and additions. To start, there isn’t really an equivalent to the way `git` detects names. If I rename files in my IDE, Fossil will view that as both a missing file and a new file. Dealing with that is just added work for me. Also, the default behavior for renaming is very odd. When you rename a file, it renames it in source control, but not on disk, so you're with what is viewed as an extra file. You can override this via an option, but it is a bizarre default. Lastly, Fossil doesn’t do a good job of highlighting new or unknown files, and in many commands, you have to specifically say to include those in the output. Many times I thought I had committed everything because the status output was clean, only to find that there were new files that I had created but weren’t being listed. 
- Though the wiki is mostly fine, I do like adding things like [Mermaid](https://mermaid.js.org) diagrams when the tool supports that. Fossil's chosen diagramming language, [Pikchr](https://pikchr.org/home/doc/trunk/homepage.md), is too low-level and ultimately inferior for the purpose.
- You can’t delete a wiki page. You can only remove its title and then it won’t show up in the list of wiki pages. Strange.
- The way branches work in Fossil is a bit confusing and overly complicated. There is a system of what are called propagating tags, but this means that branches never really get deleted, and even after they’re merged, they can spring back later in a different context. It’s hard to succinctly explain, but [browsing the docs](https://www2.fossil-scm.org/home/doc/trunk/www/branching.wiki) will give an overview of the design. The concept of a branch in `git` is pretty simple and works fine, and I don’t see what this other style is adding. 
- I miss the ecosystem of tooling. I mentioned GitUp earlier, and that’s a prime example. Since a few people use Fossil, you just can’t find much functionality beyond the main fossil binary.
- Since side projects are most of my coding these days, skill preservation is always in the back of my mind. I’ve become very familiar with `git` over many years, and that’s clearly a useful skill. I think it will be extremely rare that Fossil knowledge will be a useful skill, so staying current on `git` is a better choice.

### Future
I'd like to say Fossil was close and that if X, Y, and Z got added, I'd use it. But at this point, my view has shifted, and I no longer think Fossil will enter my workflow meaningfully unless I’m participating in a project that uses it. The reason is that I’ve realized just how complicated and specialized each of the sub-areas is. Whether we’re talking core SCM, UI, wiki, ticketing, etc., These really do benefit from tools that excel in that area and can hopefully work together well enough. Having everything in one box sounds great, and could be great, but I think the reality is that you end up with lesser versions of all the tools.  I don’t see that having them combined–while nice–really outweighs the cost of taking on less capable tools. 