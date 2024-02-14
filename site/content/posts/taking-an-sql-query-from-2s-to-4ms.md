---
title: Taking an SQL query from 2s to 4ms
date: 2024-02-14T18:46:05.545Z
draft: false
---
I don't write much SQL and I rarely have to do performance optimization since systems are so fast relative to my data sizes. But I have a homegrown logging system that using SQLite files in the hundreds of MBs that started slowing down noticeably on queries. This wasn't a big deal for usage, but it bugged me as to *why* things were slower so I went digging into the offending query:

```sql
SELECT strftime('%Y-%m-%d %H:%M:%f', datetime(created_ms/1000.0, 'unixepoch', '-8 hours')) as created, ip, level, format, event FROM events
WHERE level >= ? AND event LIKE ?
ORDER BY created DESC
LIMIT ?;
```

First check: **indexes**. Was I properly indexing the timestamp? No! Surely that must be it. So I added an index and... 😕

Second check: **LIKE query**. My quickly thrown-together query system probably was searching for things it didn't need to. So I tried some versions without that clause at all and... 😕

At this point I just start "bisecting" between fast and slow versions of this query and landed on the culprit:

`ORDER BY created DESC`

This seemed innocuous enough, especially with the index in place, but the problem was that I wasn't sorting on integer timestamps, but rather on was `created` really was:

`strftime('%Y-%m-%d %H:%M:%f', datetime(created_ms/1000.0, 'unixepoch', '-8 hours'))`

This meant SQLite was first formatting the times of *all* rows in the table and then sorting on that. I changed this bit to:

`ORDER BY created_at DESC`

and 2 second query times dropped to 4ms! 
