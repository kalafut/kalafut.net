---
layout: post
title: "Caveat when adding fragments via XML"
date: 2014-04-20T14:07:44-07:00
comments: false
categories: [ android fragments]
---

I spent an hour trying to figure our why, after replacing or removing a Fragment, the UI of the
fragment persisted (even though subsequent attempts to remove it would fail because it was
supposedly already gone).

The answer was finally found at the bottom of the [Creating a Fragment](http://developer.android.com/training/basics/fragments/creating.html) lesson.

"Note: When you add a fragment to an activity layout by defining the fragment in the layout XML file, you cannot remove the fragment at runtime. If you plan to swap your fragments in and out during user interaction, you must add the fragment to the activity when the activity first starts, as shown in the next lesson."

I _was_ in fact creating the fragment by adding it to my XML layout. It's a shame that they don't mention this in the main [Fragments Guide](http://developer.android.com/guide/components/fragments.html).
