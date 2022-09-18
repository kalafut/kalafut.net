---
date: "2016-01-24T19:14:57-07:00"
draft: true
title: "backups"
---
A Harrowing Tale

I just recovered my Lightroom Catalog that is almost 5 months out of date, and I couldn’t be happier.  An hour ago I feared it was gone.  Yes I had the photos, but the catalog contains all of the meta data… the result of an enormous amount of work, and an essential part of a large photo library.

How did it come to this?  I don’t really know, and I’ll probably never fully know. But the experiences is a cautionary tale with some important lessons about backup and file management. Here’s the chronology

~10/1/15 - Disk Utility reports that my MacBook has disk (SSD) issues and needs to be reformatted. That’s a major ordeal, and since I planned to update to El Capitan once the .1 release came out, I waited for a few weeks

10/22/15 - I do a complete disk image copy to an external SSD
10/23/15 - I wipe my SDD and install El Cap
10/24/15 - I spend a good chunk of time copying things back, getting accounts set up, etc. It’s slow but uneventful. Until I opened Lightroom…

And there was nothing there. But wait, duh, I need to copy over the catalog which tell LR where everything is. I notice that the local copy of the catalog is only about 1MB, not the ~100MB I’d expect. I look on the external drive and find… 1MB catalog. WTF? OK, surely I must have been using a non-standard catalog location. I spend a bunch of time look, and run lots of searches for .lrcat. Nothing. I even boot off the external drive, back into what should have been the state of my Mac from a day ago. I start Lightroom (I’d been in there about a week ago), and get:  “Can’t Find Catalog.”  Oh shit. 

Pause now for a review of my backups.  I use Arq, and I back up to a NAS, AWS, and some things to Google Drive.  Surely I’m covered…

The scary “Can’t Find Catalog” message had a useful piece of information. It was looking for it in a …/recovery/… folder.  This folder was yet an older generation of my data from when I change computers.  So for whatever reason, my catalog was being using from there, not the expected /Pictures/ folder. I suspect I messed up, or didn’t fully migrate something. But the /recovery/ folder on my external HD has lots of stuff, but not a LR catalog!?!  To the backups…

I fire up Arq and start looking in the AWS backups, since they’re the most inclusive.  No recovery folder in there.  Was it excluded intentionally?  No idea.  I start looking at older backups and find that back in April 2014, it WAS there and it did have a sizable catalog!  I start the restore…  Welcome to the bad part of AWS Glacier that you’re warned about.  Figure I get all sorts of “it will cost you this much” message, then I have to wait 4 hours to get the file. Ugh. It’s like 88MB… please just give me the file! Well, they truly have me in a corner and I agree. While Arq is waiting, I take a look at the NAS backups. Again, no /recovery/ folder, until June 2015, where I see the folder and a catalog!  I copy it out to the local drive immediately, at *it works*.  For some reason, the next backup a few days later shows the /recovery/ folder being deleted from subsequent backups. I have no idea why.
   
Some important lessons here:

* I brought this on by being lazy about wrapping up an old migration. We all have those “/old_d_drive” folders, and they tend to be filled with stuff we forget about. Lightroom should have never been attached to a catalog there. I suspect I wanted to try it way back when, before I’d moved data locally, and when it worked I never thought about it.
* AWS Glacier kinda sucks. I’m sorry… you can take my money, but don’t make me wait for some artificial 4 hours for a file as I’m panicking and trying to diagnose a problem.  I’ll be checking out Google Nearline in earnest.
* Arq performed well.  I’d just installed it on the fresh OS, but it was easy to attach to my existing backup endpoints.
* The Synology NAS delivered the goods when I most needed it.
* Having historical backups is a life saver. With just a copy of my data, I’d have been screwed. Thank’s to Arq I was able to travel back in time many months to before the folder was mysterious deleted from backups.


I can’t explain how a file that was used just days ago suddenly vanished.  I can’t explain why backups of it stopped months ago.  I only know that this event was a stern warning that “Set it and forget it” is not a backup strategy. 

Update on 1/24/2016

The above content was hastily written in TextEdit and only tonight was to be reviewed in preparation for posting. I opened TextEdit,
selected the recent file "Backup Blog Post", and found an empty document. In the Finder I could see that it was modified the preceding
evening, and I have no idea why. Though this particular file happened to live in iCloud Drive, so I guess I do have an idea why... In
any case it was back into Arq, back to restoring from backup, and here we are. Typing into a restored-from-back blog post about restoring from backups.
