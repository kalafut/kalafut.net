---
layout: post
title: Fixing Multi-Track Audio Playback for Plex on Samsung
date: 2022-02-25T04:36:26.117Z
description: Blah
---
A [much](https://www.reddit.com/r/PleX/comments/a9pvyt/samsung_plex_tv_app_audio_track_playback_issue/) [complained about](https://forums.plex.tv/t/bug-samsung-plex-and-changing-audio-track/215752) issue with the otherwise pretty decent Plex app for Samsung TVs is that despite giving you the impression that you're choosing the audio track, the app actually only ever plays the first track. This is **very** annoying, and not that uncommon with my collection which has a lot of foreign films
where the English track isn't the first item. I played with some of the proposed solutions.

**Turning off Direct Play** was suggested, and does work for the audio bit, but it causes immense struggle for my little raspberry pi on high bitrate films, so this isn't really an good option.

**Updating the .mkv metadata** does work, and isn't too difficult. There are a few ways I've seen written about but here's the one I used:

1. Download [MKVToolNix](https://mkvtoolnix.download/). This is free and available for many platforms.
2. Drag your .mkv file to the Multiplexer tool.
3. Reorder the audio tracks by dragging and dropping them. The one you want should be first. Alternatively, you can deselect all of the tracks you don't want, which results in a smaller file.
4. On the output tab, specify a different filename for the output.
5. "Start Multiplexing"

Fortunately this operation is just fiddling with metadata and you're not reencoding anything. It completes in a few seconds. Check your audio track setup in VLC and if all is well, you're done.