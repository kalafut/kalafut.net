---
title: Should've AUTOINCREMENTed
date: 2024-07-08T06:26:14.660Z
draft: false
---
The [SQLite docs](https://www.sqlite.org/autoinc.html) steer you away from AUTOINCREMENT:

> The AUTOINCREMENT keyword imposes extra CPU, memory, disk space, and disk I/O overhead and **should be avoided if not strictly needed. It is usually not needed.**

The short version of not using AUTOINCREMENT is that primary keys can be reused following their deletion. And the problems with not properly accounting for this just bit me. In my case, a cache in my app was referencing a user ID, which meant that following a user deletion and creation, the old cache data was associated with the new user 😬. Fortunately in this case it just meant a performance degradation (other guards rejected the cache hit), but it could have been worse.

From a pure, database-centric point of view I get why the SQLite team comes off strong against AUTOINCREMENT. With foreign key checks in place within the perimeter of the database, it's fine. But IDs will bleed into the app, and I think it is tough to guard against weirdness due to ID reuse.