---
title: Blog mechanics refresh
date: 2026-08-29T23:54:40.928Z
draft: false
bearID: 2C3393DD-AC57-4AD0-AAB5-5DFB475E7AD0
---
Testing 1… 2… 3…


# Markdown Kitchen Sink
A single document exercising most of the elements you'll meet in CommonMark plus the common GitHub-flavored extensions. Useful for testing renderers, themes, and CSS.
# Headings
# H1 — Level One
# H2 — Level Two
### H3 — Level Three
**H4 — Level Four**
**H5 — Level Five**
**H6 — Level Six**
Setext style also works:
# Alternate H1
# Alternate H2
# Inline text formatting
This is *italic*, this is *also italic*. This is **bold**, this is **also bold**. You can go ***bold italic*** or ~~strike it out~~ entirely.
Inline code spans use backticks. If your code contains a backtick, use double `backticks` .
Sub/superscript sometimes render via HTML: H<sub>2</sub>O and E = mc<sup>2</sup>.
Escapes let you show literal characters: *not italic*, _not italic_, # not a heading.
Line breaks: end a line with two spaces to force a hard break inside a paragraph.
A backslash also works like this.
Emoji shortcodes on some platforms: :rocket: :warning: :white_check_mark:
# Links
* Inline link: ~[Anthropic](https://www.anthropic.com/)~
* Link with title: ~[CommonMark](https://commonmark.org/)~
* Reference link: ~[Markdown Guide](https://www.markdownguide.org/)~
* Collapsed reference: ~[guide](https://www.markdownguide.org/)~
* Autolink: ~[https://example.com](https://example.com/)~
* Email autolink: ~[someone@example.com](mailto:someone@example.com)~
* Relative link: ~[another doc](https://claude.ai/chat/other-file.md)~
* Anchor link: ~[jump to tables](https://claude.ai/chat/a66c0e67-b9b2-403e-a449-d3854570c3a7#tables)~

⠀Images
![](/img/blog-mechanics-refresh/png.png)
Linked image:
![](/img/blog-mechanics-refresh/status-sample-blue.svg)
# Lists
### Unordered
* First item
* Second item
  * Nested item
  * Another nested item
    * Third level
* Third item

⠀Alternate bullets:
* Asterisk bullet
* Plus bullet

⠀Ordered
1 First
2 Second
	1 Nested first
	2 Nested second
3 Third

⠀Numbers don't have to be sequential in the source:
1 One
2 Two
3 Three

⠀Starting at another number:
7 Seven
8 Eight

⠀Task list
* [x] Write the sample document
* [x] Include a task list
* [ ] Test in three renderers
  * [ ] Nested subtask
  * [x] Completed subtask

⠀Loose vs. tight lists
A tight list:
* one
* two

⠀A loose list (blank lines between items, so each gets a <p>):
* one
* two

⠀List item with block content
1 A paragraph inside a list item. A second paragraph, indented three spaces to stay in the item. ### echo "even a code block"
### 2  and a blockquote 
3 Back to the next item.

⠀Definition list (extension)
Term : Definition of the term.
Another term : First definition. : Second definition.
# Blockquotes
A single-level blockquote.
With a second paragraph.
Nesting works too:
This is nested one level deeper.
And another.
Blockquotes can contain other elements:
* a list
* with items

⠀const inQuote = true;
— *Attribution line*
### Alert / callout syntax (GitHub)
[!NOTE] Useful information the reader should know.
[!TIP] Helpful advice for doing things better.
[!IMPORTANT] Key information needed to succeed.
[!WARNING] Urgent info needing immediate attention.
[!CAUTION] Advises about risks or negative outcomes.
# Code
Indented code block (four spaces):
### function legacy() {
###   return "indented block";
### }
Fenced with no language:
### plain fenced block
###   preserves    whitespace
JavaScript:
### async function fetchUser(id) {
###   const res = await fetch(`/api/users/${id}`);
###   if (!res.ok) throw new Error(`HTTP ${res.status}`);
###   return res.json();
### }
Go:
### package main

### import "fmt"

### type Org struct {
### 	ID   string
### 	Name string
### }

### func main() {
### 	o := Org{ID: "org_123", Name: "Acme"}
### 	fmt.Printf("%s -> %s\n", o.ID, o.Name)
### }
Python:
### from dataclasses import dataclass

### @dataclass
### class Point:
###     x: float
###     y: float

###     def norm(self) -> float:
###         return (self.x ** 2 + self.y ** 2) ** 0.5
SQL:
### SELECT u.id, u.email, COUNT(m.id) AS memberships
### FROM users u
### LEFT JOIN memberships m ON m.user_id = u.id
### GROUP BY u.id, u.email
### HAVING COUNT(m.id) > 1
### ORDER BY memberships DESC;
Diff:
### - const timeout = 30;
### + const timeout = 60;
###   const retries = 3;
JSON:
### {
###   "name": "sample",
###   "version": "1.0.0",
###   "private": true,
###   "scripts": { "build": "vite build" }
### }
YAML:
### services:
###   web:
###     image: nginx:alpine
###     ports:
###       - "8080:80"
###     environment:
###       - NODE_ENV=production
Tildes work as fences too, which is handy when the content contains backticks:
### Here is a fenced block inside a fenced block:

### ```js
### console.log("hi");
### ```
# Tables
| **Element** | **Syntax** | **Supported** |
|:-:|:-:|:-:|
| Heading | # Text | Yes |
| Bold | **text** | Yes |
| Code block | ```lang | Yes |
Alignment:
| **Left aligned** | **Center aligned** | **Right aligned** |
|---|:-:|--:|
| apples | apples | 1.00 |
| bananas | bananas | 12.50 |
| cherries | cherries | 123.75 |
Tables can hold inline formatting:
| **Feature** | **Notes** |
|:-:|:-:|
| **Bold** | works |
| code | works |
| ~[link](https://example.com/)~ | works |
| pipe escape | here | works |
# Horizontal rules
Three or more of -, *, or _:



# Footnotes
Markdown supports footnotes in many renderers.[^1] You can have several.[^note]
[^1]: This is the first footnote. [^note]: Named footnotes work too, and can contain **formatting** and multiple lines when indented.
# Math (KaTeX / MathJax)
Inline math: $E = mc^2$ and $\sum_{i=1}^{n} i = \frac{n(n+1)}{2}$.
Block math:
$$ \int_{-\infty}^{\infty} e^{-x^2} , dx = \sqrt{\pi} $$
# Diagrams (Mermaid)
### graph TD
###     A[Client] -->|HTTP| B(API Gateway)
###     B --> C{Authenticated?}
###     C -->|Yes| D[Service]
###     C -->|No| E[401 Response]
###     D --> F[(Database)]
### sequenceDiagram
###     participant U as User
###     participant S as Server
###     U->>S: POST /session
###     S-->>U: 201 Created
# Inline HTML
<div align="center"> <strong>Centered HTML block</strong><br /> <em>with a line break</em> </div> <details> <summary>Click to expand a collapsible section</summary>
Hidden content can include **markdown**, lists, and code:
* item one
* item two

⠀ls -la
</details>
<kbd>Ctrl</kbd> + <kbd>C</kbd> renders as keyboard keys.
Raw HTML table:
<table> <tr><th>Col A</th><th>Col B</th></tr> <tr><td>1</td><td>2</td></tr> </table> <!-- This is an HTML comment and should not render. -->
Edge cases worth testing
A very long line to check soft wrapping behavior in your renderer: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
Consecutive lines without blank lines form a single paragraph.
Unicode and symbols: café, naïve, 日本語, Ελληνικά, ✓, ✗, →, ©, ½, —
A line ending in a URL that should not become a link: https://example.com
Empty list item:
* 
* non-empty

⠀Summary
| **Category** | **Elements covered** |
|:-:|:-:|
| Text | headings, emphasis, strikethrough, escapes, breaks |
| Blocks | lists, task lists, quotes, alerts, rules, definitions |
| Code | indented, fenced, tilde-fenced, many languages |
| Data | tables with alignment and inline formatting |
| Extras | footnotes, math, mermaid, raw HTML, details |
*End of document.*
