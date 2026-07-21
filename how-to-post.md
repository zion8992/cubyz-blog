# How to Post

To post you will first want to create a directory of your own in `content/<username>`. This is your directory, you can organize it how you want.  
I recommend using the organization: `content/<username>/<year>`.

To create a post run:
```
hugo new content content/<username>/<year>/<postname>.md
```

This will automatically generate a post.

## Setting Post Metadata

On the top of the post, there is a metadata section:
```md
---
title: "Welcome" # post title
date: 2026-03-14 # date yyyy-mm-dd
authors: ["zion8992"] # your username
tags: ["cubyz-blog"] # tags
---

Test
```

## Images and Assets

You can add your own assets, **under 800MB** at `assets/usercontent/<username>`. That folder is also yours to control.

## Publishing

To publish create a pull request.