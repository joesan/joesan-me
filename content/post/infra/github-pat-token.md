+++
title="GitHub Personal Access Token For Local Development"
description="Use Tokens Instead Of Passwords""
date=2024-12-12

categories = ["Technical Stuff"]
tags = ["github", "git"]
+++

TODO: use this as reference - https://sheepblackish.medium.com/set-up-git-credentials-on-mac-os-with-private-key-github-access-token-8bf7b79e91d4

Add the token to your credential helper by running a git command that requires password to authenticate.

$ git clone https://github.com/username/repo.git
Username: your_username
Password: your_token (The token you generated from Github)
