---
title: Apple Photos Dates
layout: post
---

The search for an acceptable digital photo management solution is neverending. Sometime I'll write about that
whole process, but for now I want to capture one very annoying and important gotcha with the current system.
My current process has photos flowing through Apple Photos since they're automatically uploaded from my iPhone.
Apple Photos is acting as a convenient queue, since the final resting places for these photos are:

1. an external USB HD
2. Backblaze (auto backup from USB HD)
3. Google Drive (auto backup as well)

Once photos are where they need to be, I delete them from Apple Photos.

To get photos out of Apple Photos, I use "Export Unmodified Originals". This works fine but has a severe limitation:
photos that *look* like they have date information might not actually have a date once exported. I was alerted to this when I saw some
really old photos showing up as from today in Google Photos following some cleanup.

Here's what I believe is going on. I take some photos with by phone, but I also receive a lot of photos from various sources, for
example WhatsApp or Signal. These photos magically make their way into the Apple Photos ecosystem, but the image files
are often quite bare. They have no EXIF data (most critically: date) and have generic filenames like IMG_5024.jpg.
But Apple Photos is showing these in a proper timeline, somehow. It appears to me that the only encoding of date is through the
folder structure that Apple Photos is using. Once files are exported, the new files have a current date on the
files themselves and no EXIF data, which is pretty much useless to anything trying to accurately put them in a timeline.

Now that I'm aware of this, I will probably be taking a different tack and write a script to use [exiftool](https://www.sno.phy.queensu.ca/~phil/exiftool/) to add EXIF
data to these photos before they're removed from Apple Photos. Until that script, I'll just not delete those photos.


