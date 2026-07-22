---
title: "Git LFS"
date: 2026-03-22
draft: false
authors: ["zion8992"]
tags: ["git"]
---

Github warns you when pushing files above `50MB` and blocks the files entirely when above `100MB`.

That is where [git lfs](https://git-lfs.com) comes in. It's a large file store for git.

Here's how to set up and use Git LFS to store large files in your GitHub repository.

## 1. Install Git LFS

Git LFS is a separate extension from Git. Install it first:

```sh
# Debian/Ubuntu
sudo apt install git-lfs

# macOS (Homebrew)
brew install git-lfs

# Fedora
sudo dnf install git-lfs
```

Then enable it for your user account (only needs to be done once per machine):

```sh
git lfs install
```

## 2. Track the large files

Inside your repository, tell Git LFS which files to manage. You can track by extension or by specific path:

```sh
# By file extension
git lfs track "*.psd"
git lfs track "*.zip"
git lfs track "*.bin"

# A specific file
git lfs track "assets/bigfile.dat"

# An entire directory
git lfs track "assets/**"
```

This creates (or updates) a `.gitattributes` file that records the tracking rules.

## 3. Commit the `.gitattributes` file

The `.gitattributes` file must be committed so the tracking rules apply for **everyone** who clones the repo:

```sh
git add .gitattributes
git commit -m "Configure Git LFS tracking"
```

Important: tracking only affects files added *after* the rule exists. If a large file is already committed in history, you need to migrate it (see below).

## 4. Add, commit, and push as normal

You can generate a large file:

```sh
# you can generate a big file using fallocate
fallocate -l 70M largefile.bin
```

Commit and push changes:

```sh
git add assets/really-big-file.bin
git commit -m "Add large asset"
git push origin master
```

Git stores a lightweight text pointer in the repository, while the actual file content is uploaded to GitHub's LFS storage. When someone clones or checks out the branch, Git LFS automatically downloads the real files during checkout rather than during the initial fetch, this makes LFS cool.

## Migrating files already committed

If a large file is already in your Git history, you must migrate it. Use `git lfs migrate`:

```sh
# WARNING THIS WILL REWRITE HISTORY!!! DO NOT DO WITHOUT COLLABORATOR PERMISSION!!!
git lfs migrate import --include="*.bin" --everything
```

Then force-push. (Be careful: this rewrites history, so coordinate with collaborators.)

## Verifying what's in LFS

```sh
# List files currently tracked by LFS
git lfs ls-files

# Show current tracking patterns
git lfs track
```