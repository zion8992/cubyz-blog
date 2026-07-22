---
title: "How to post on this blog"
date: 2026-03-22
authors: ["zion8992"]
tags: ["cubyz-blog"]
---

# Post Guidelines (Read first)

Before you post or create a PR, ensure to read the [posting guidelines](https://zion8992.github.io/cubyz-blog/pages/guidelines.md)

# How to Post

To post you will first have to create a directory for your posts, you can use the direcotry `content/<your username>`. 

This is your directory, you can organize it however you want.  
I recommend organazing by year: `content/<username>/<year>`.

## Creating a post

To create a post run:
```
hugo new content content/<username>/<year>/<post name>.md
```

This will automatically generate a post and all the associated metadata like the date.

## Writing your post

On the top of the post, there is a metadata section:
```md
---
title: "Welcome"               # post title
date: 2026-03-14               # date yyyy-mm-dd
authors: ["zion8992"]          # your username
tags: ["cubyz-blog"]           # post tags
---

Post content goes here. You can use markdown to format it.

[Learn more about markdown](https://markdownguide.org).
```

## Images and Assets

Assets are stored differently depending on their type.

### Video & Audio

For video and audio, you must use external services like [youtube](https://youtube.com) or [soundcloud](https://soundcloud.com) and link or embed the files to your post.

### Images

#### Under 50MB

You can add your own **image** assets, **under 50MB** at `static/static/<username>`. You have a **quota of 250MB** in total.
**NOTE**: The second `/static/` in the path is correct!          ^^^^^^ -----> Not a typo

#### Over 50MB

To add an image **over 50MB**, you must install `git-lfs`. You can read a blog post on how to setup `git-lfs` [here](https://zion8992.github.io/cubyz-blog/blog/zion8992/2026/git-lfs/).

## Publishing

To publish create a pull request on the [zion8992/cubyz-blog](https://github.com/zion8992/cubyz-blog/pulls) repository.