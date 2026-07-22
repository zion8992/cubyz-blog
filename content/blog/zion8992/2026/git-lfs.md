---
title: "How to setup Git LFS"
date: 2026-03-22
draft: false
authors: ["zion8992"]
tags: ["git"]
---


Git LFS is mandatory on this blog for files **above 50MB** since Github will warn you when pushing files above `50MB` and blocks the files entirely when above `100MB`.

That is where [git lfs](https://git-lfs.com) comes in. It's a large file store for git.

Here's how to set up and use Git LFS to store large files in your GitHub repository.

## 1. Install Git LFS

Git LFS is a *separate extension* from Git. Install it first:
You can find more install guides on [the git lfs website](https://git-lfs.com/) or [here](https://github.com/git-lfs/git-lfs?utm_source=gitlfs_site&utm_medium=installation_link&utm_campaign=gitlfs#installing).

```sh
# Debian/Ubuntu
sudo apt install git-lfs

# macOS (Homebrew)
brew install git-lfs

# Fedora
sudo dnf install git-lfs
```

## 2. Enable Git LFS

Then enable it for your user account (**only needs to be done once per machine**):

```sh
git lfs install
```

## 3. Track the large files

Inside the blog repository, tell Git LFS which *large* files you want to add. You can track by extension or by specific path:

```sh
# By file extension
git lfs track "*.png"
git lfs track "*.webp"
git lfs track "*.jpg"

# A specific file
git lfs track "assets/<your username>/large-image.png"

# An entire directory
git lfs track "assets/<your username>/**"
```

## 4. Add, commit, and push as normal

Commit and push changes:

```sh
git add assets/<your username>/large-image.png
git commit -m "Added a picture of a very large mount with Cubert at the very top. You can almost see the breeze passing through Cubert's singular ear and the sound of the blocky birds fills your ears (a bit too much) with chirps."
git push
```

Git stores a lightweight text pointer in the repository, while the actual file content is uploaded to GitHub's LFS storage. When someone clones or checks out the branch, Git LFS automatically downloads the real files during checkout rather than during the initial fetch, this makes LFS cool.

## Migrating files already committed

If a large file is already in your Git history, you must migrate it. Use `git lfs migrate`:

```sh
# WARNING THIS WILL REWRITE HISTORY!!! DO NOT DO WITHOUT COLLABORATOR PERMISSION!!!
git lfs migrate import --include="*.bin" --everything
```

Then force-push. (Be careful: this rewrites all git history, so coordinate with collaborators.)

## Listing what's in LFS

```sh
# List files currently tracked by LFS
git lfs ls-files

# Show current tracking patterns
git lfs track
```

# Repo owners

## For repos that don't have Git LFS already 

The `.gitattributes` file must be committed so the tracking rules apply for **everyone** who clones the repo:

```sh
git add .gitattributes
git commit -m "Configure Git LFS tracking"
```

**Important**: Large file tracking only affects files added *after the `.gitattributes` exists*. If a large file is *already committed in history*, you need to migrate it (see above).

## Generating a test file

You can generate a large file:

```sh
# you can generate a big file using fallocate
fallocate -l 70M largefile.bin
```