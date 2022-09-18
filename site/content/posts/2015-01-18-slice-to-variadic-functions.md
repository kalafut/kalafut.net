---
layout: post
title: "Passing slices to variadic functions"
date: 2015-01-18
categories: [ golang]
---
I knew about variadic functions, and the "..." syntax, but I'd assumed that was
limited to the function declaration. When I tried to pass a slice of arguments
as the final parameter of a call to a variadic function, I got errors. The 
answer is of course in the spec, but I didn't find it quickly:

    v := foo(bar, baz...)

So "..." shows up again. Here's the relevant section of the spec:

[Passing arguments to ... parameters](http://golang.org/ref/spec#Passing_arguments_to_..._parameters)
