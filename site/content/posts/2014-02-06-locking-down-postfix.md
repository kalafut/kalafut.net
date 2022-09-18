---
layout: post
title: "Locking down Postfix"
date: 2014-02-06T20:07:36-08:00
comments: false
categories: [ postfix]
---

I run [Postfix](http://www.postfix.org/) on my VPS's exclusively to send mail. They're configured to route mail to
[Mailgun](http://www.mailgun.com/), and I've made sure that they're not an open relay. I also
receive a daily logwatch email and it doesn't help to have a bunch of this:

    Feb  4 18:31:47 alpha postfix/smtpd[14138]: connect from unknown[63.115.40.56]
    Feb  4 18:31:47 alpha postfix/smtpd[14138]: NOQUEUE: reject: RCPT from unknown[63.115.40.56]: 554 5.7.1 <therichsheickc@
    yahoo.com>: Relay access denied; from=<test@live.com> to=<therichsheickc@yahoo.com> proto=ESMTP helo=<[192.168.2.33]>
    Feb  4 18:46:31 alpha postfix/smtpd[14153]: connect from client002.c039228.customers.cinergycom.net[69.196.196.138]
    Feb  4 18:46:31 alpha postfix/smtpd[14153]: NOQUEUE: reject: RCPT from client002.c039228.customers.cinergycom.net[69.196
    .196.138]: 554 5.7.1 <therichsheickc@yahoo.com>: Relay access denied; from=<test@live.com> to=<therichsheickc@yahoo.com>
     proto=ESMTP helo=<[192.168.2.33]>

 I had a couple of options. This first is to modify [master.cf](http://www.postfix.org/master.5.html) to deny SMTP access from "inet". I tried it and it did work, but I didn't really care for the solution since it didn't gel that well with my Ansible configuration for the host. The other option was to just lock down port 25, period. I was down the road of re-re-re-acquainting myself with [iptables](http://en.wikipedia.org/wiki/Iptables)--something I do seldom and immediate forget--and then I came across
 [ufw](https://help.ubuntu.com/community/UFW). The cryptic iptables syntax is replaced with:

    ufw allow http/tcp
    ufw enable

(by default everything is rejected)


This worked just fine and I was able to easily whitelist a few key ports in my base Ansible file. We'll see tomorrow whether the logwatch email thins out.



 ** Interesting note: testing this stuff from my laptop didn't work. By spinning up another VPS and successfully connect to port 25 (so I could then verify that I couldn't connect after the changes), I confirmed that it was my ISP (Comcast). I've now learned that blocking port 25 except to the ISP's mail server [is a thing](http://www.postcastserver.com/help/Port_25_Blocking.aspx).
