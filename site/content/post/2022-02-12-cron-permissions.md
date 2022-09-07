---
layout: post
title: A Thorny Cron Permission Issue
---

I recently gave the [restic](https://restic.net/) backup tool a try and was impressed. To date I've just relied on Apple's
Time Machine, but it seems to almost _always_ be backing or cleaning for no clear reason. I found that restic's
scans of the things I wanted to back up completed within a minute. Sold on using it in earnest, I decided to automate it by adding a `cron` job. This was met with... no backups. The troubleshooting ensued:
Y
* Is the crontab [set up correctly](https://crontab.guru)? Should be fine with `* * * * *` for testing. ❌
* Maybe it's erroring? [Stack Overflow](https://apple.stackexchange.com/questions/38861/where-is-the-cron-log-file-in-macosx-lion) taught me that the output from `cron` will by go nowhere by default (on MacOS), so I added `>/tmp/stdout.log 2>/tmp/stderr.log` and took a peek. YES there was an error about the directory I was running in. I updated my command: `cd /Users/kalafut && ./restic_backup.sh >/tmp/stdout.log 2>/tmp/stderr.log`. It helped, but then I got a new error. ❌
* `ReadDir: open /Volumes/TIME MACHINE/restic/keys: operation not permitted`. I changed the owner of the `restic` folder. Nothing. Verified that the user running the process was me. Looks good. Hmmm. ❌
* Lots of searching led me to the Full Disk Access permissions on MacOS, which seemed promising. I gave permission to `restic` but that didn't help either. This made sense, given that I could run it fine from the CLI manually. ❌
* The Aha moment: I need to give _`cron`_ Full Disk Access. It worked!!! 🎉




