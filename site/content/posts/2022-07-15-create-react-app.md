---
layout: post
title: Create React App Proxy Setup
date: 2022-07-15
---

A Go/[Fiber](https://gofiber.io) side project I'm working on needs some interactive elements. I started making some additions
using [AlpineJS](https://alpinejs.dev/) and [HTMX](https://htmx.org), but things grew to the point that I decided a dedicated JS view
library would be worthwhile. Usually I reach for the awesome and under-mentioned [Mithril.js](https://mithril.js.org), but I've
not visited the world of React in many years, so I decided to start there instead.

I was definitely impressed at how the very first guidance you get is tailored to your needs. I intended to just start
with [adding a React element to a page](https://reactjs.org/docs/add-react-to-a-website.html),
and being able to browser-load both React and Babble (for JSX) was super simple.
But I knew that was just a "Hello World" phase and that I've have to face the complexity of Webpack, Parcel, Vite or whatever
is the rage these days. I wasn't really looking forward to that.

In addition to my dread of drowning in a tar pit of Javascript build tooling, my original plan of just adding a little React
component started to grow in size. There were now parts that really felt more suited for a full-fledged single-page
app experience. Given all this, I turn to [Create React App](https://create-react-app.dev) (CRA).

I love this project. You can either spend your days reading tutorials and Stack Overflow on how to
bootstrap React, or you just [run three commands](https://create-react-app.dev/docs/getting-started#quick-start) and have
it all done and running for you in an officially supported way. Easy decision.

So I have at this point a Go backend that can serve requests, and the CRA server that offers all sorts of goodness such as live reloading and instantaneous error reporting. I didn't want to give up that nice Javascript dev experience by just serving up build artifacts with the backend, but I also wanted (obviously) a single URL to visit regardless of whether the portion was being served from the backend or as part of the React app.

This is a common scenario, and there are official docs covering [proxying](https://create-react-app.dev/docs/proxying-api-requests-in-development) and lots of additional articles out there on the topic. But it did take me some trial and error to achieve what I was looking for:

* The React app can make requests to the backend without any special URLs (i.e. it’s as if they’re from a single server, like the production build will be).
* Requests to the React app are made to `/app/*` and handled by the CRA web server.
* All other paths are handled by the Go server.

### Proxy Setup

The changes required are small but took a bit more searching and fiddling than I’d expected. I landed on:

1. Install the proxy:

    ```
    npm install http-proxy-middleware --save
    ```

2. Create a file called `src/setupProxy.js` that looks something like:

    ```js
    const { createProxyMiddleware } = require('http-proxy-middleware');

    module.exports = function(app) {
        app.use(/\/(?!app).*/, createProxyMiddleware({
                target: 'http://localhost:3001',
                changeOrigin: true,
            })
        );
    };
    ```

    Figuring out I needed to use a regex in `app.use()` to properly proxy all but the React components was the breakthrough over just setting a string path.

    **Note**: editing the `src/setupProxy.js` file triggers activity in the CRA watch process, but changes don’t seem take effect until you restart CRA.

3. Add new homepage setting to `package.json`:

    ```
    ...
    "homepage": "/app",
    ...
    ```

    This tells CRA to slot all of its output (e.g. bundles and assets) under that path, so the CRA server will handle them.

And that’s it! Now I hit the standard `localhost:3000` address for development and requests are handled by the appropriate server.

