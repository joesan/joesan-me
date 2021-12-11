+++
title="Keeping up with Upstream Git Repo"
description="Make your fork sync with Upstream"
date=2021-02-22

[taxonomies]
categories = ["Technical Stuff"]
tags = ["git"]
+++


If you have forked a repository in GitHub that you want to work on, you do so, make your changes locally and once you are confident that everything works, you
issue a pull request to the upstream so that your changes can be reviewed and merged. Here is a small snippet that I use to keep my fork up-to-date with the upstream.

upstream - The original repository from which you fork

Step 1: Add the remote upstream repo

```
git remote add upstream https://github.com/ORIGINAL_OWNER_NAME/ORIGINAL_REPO_NAME.git
```

Step 2: Check if upstream is referenced

```
git remote -v
```

should print out the following:

```
origin https://github.com/FORKED_OWNER_NAME/ORIGINAL_REPO_NAME.git (fetch)
origin https://github.com/FORKED_OWNER_NAME/ORIGINAL_REPO_NAME.git (push)
upstream https://github.com/ORIGINAL_OWNER_NAME/ORIGINAL_REPO_NAME.git (fetch)
upstream https://github.com/ORIGINAL_OWNER_NAME/ORIGINAL_REPO_NAME.git (push)
```

Step 3: Run the following commands to update forked repo with changes from original repo

```
git fetch upstream
```

Step 4: Checkout master branch from the local fork

```
git checkout master
```

Step 5: Merge changes from upstream/master into local master form

```
git merge upstream/master
```

Step 6: To check if your local forked master is up-to-date with upstream master, run the following

```
git fetch upstream && git diff remotes/upstream/master master > changes.diff
```

If there are no changes, then the diff file should be empty. You could combine all that in a script. That's it!