---
title: Text-based Taxes
layout: post
date: 2016-03-24
---

It's that time of year again: I start thinking about how inefficient the tax preparation
process is. And this is not targeted at the IRS (though it deserves it), but rather tax prep
software. Every year I think, "Why, when there are so few bits of actual data that I need to feed in,
does this take so damn long?" I think the answer is that I don't fit the TurboTax/TaxAct profile very
well. I'm much closer to being the guy filling out the forms by hand with a copy of [JK Lasser] next to him,
but I also can't stand the idea of doing--and redoing--all of that math by hand.

I've seen a couple of Python/text-based tax projects recently and I'm more than a little interested
([py1040], [python-taxes]). I already use [Ledger] for finances and the idea of a simple text file
that I can manage in git is something I want to spread to as many areas as possible. I don't really
care too much for the particular way these two projects are handling taxes, but the idea is really
good. So good that this evening I was toying around with some proofs of concept for ways to capture
both form particulars (i.e. the math and logic), as well as the individual's numbers that flow into
the forms.  Python *is* a good choice. I found that I could express both aspects as Python without
it looking like a program. And by using Python even for the "data entry" part of it, once can nicely
capture intermediate calculations and do simple math that results in some number which the form
requires.  With all this checked in to git, the following year will be much easier since all of the
previous notes and calculations will be in place.

It's way too late for this to become part of the 2015 tax season, but I am keen to throw enough
together to see how the results compare to my real return. I know that if I don't make some progress
now, while taxes are on my mind, it certainly isn't going to happen in July.

[py1040]: https://github.com/b-k/py1040
[python-taxes]: https://github.com/davidcmoore/python-taxes
[JK Lasser]: http://www.amazon.com/dp/1119133920
[Ledger]: http://ledger-cli.org
