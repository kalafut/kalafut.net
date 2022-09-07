---
title: JSON, MessagePack, Protobuf... LZMA don't care
layout: post
date: 2017-12-10
---

I've often come across comparisons between JSON, [MessagePack](https://msgpack.org) and [Protocol Buffers](https://developers.google.com/protocol-buffers/) (protobuf) for transfer and/or storage. The conclusion usually ends up being: after compression, it doesn't matter. But when faced with the choice on my own project recently, I couldn't help thinking that reduced verbosity on the input could only be a benefit. Plus is just seems only proper to tightly pack integers and binary data, remove formatting that only benefits humans, etc. So naturally I had to try all three.

I will forgo any exact details because they don't really matter. The data being stored was many records of string and integral data, and the output was compressed with [LZMA](https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Markov_chain_algorithm) (e.g. [xz](https://en.wikipedia.org/wiki/Xz)).  The pre-compression were results were unsurprising. Relative to JSON:

- MessagePack: 40% reduction
- protobuf: 80% reduction

But *after* LZMA compression, all of the file sizes were within about 5% of each other. I tried many different configurations of input data, such as biasing things towards types that would benefit from binary representations, but after compression it really didn't matter much. Modern compression is just too good at removing redudant information.

So I consider this result a good rule of thumb. Yes, any particular situation might skew one way or another. And if speed is the concern then using different compression, or no compression at all, will have a big impact. In these cases the choice of format can really make a difference.

But for data that will be compressed, the starting point for the analysis should be: the resulting sizes will be the same. [LZMA don't care](https://www.youtube.com/watch?v=4r7wHMg5Yjg).
