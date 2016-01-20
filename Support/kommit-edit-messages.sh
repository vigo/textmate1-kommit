#!/usr/bin/env bash
#
# Created by Uğur Özyılmazel on 2016-01-19.
# Copyright (c) 2016 webBox.io. All rights reserved.

set -e
source "$TM_BUNDLE_SUPPORT/common.sh"

if is_kommit_available && in_git_repo; then
    git_dir=$(git rev-parse --git-dir)
    /Applications/TextMate.app/Contents/SharedSupport/Support/bin/mate $git_dir/kommit-message
fi
