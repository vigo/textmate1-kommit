#!/usr/bin/env bash
#
# Created by Uğur Özyılmazel on 2016-01-19.
# Copyright (c) 2016 webBox.io. All rights reserved.

set -e
source "$TM_BUNDLE_SUPPORT/common.sh"

input_box() {
    res=$(CocoaDialog inputbox --title "${KOMMIT_TITLE}" \
        --informative-text "Enter your message?" \
        --button1 "Add" --button2 "Cancel")
    [[ $(head -n1 <<<"$res") == "2" ]] && exit_discard
    res=$(tail -n1 <<<"$res")
    kommit -m "$res"
}

if is_kommit_available && in_git_repo; then
    input_box
fi
