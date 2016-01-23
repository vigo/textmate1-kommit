#!/usr/bin/env bash
#
# Created by Uğur Özyılmazel on 2016-01-19.
# Copyright (c) 2016 webBox.io. All rights reserved.

set -e

KOMMIT_TITLE="Kommit"

exit_discard () { echo -n "$1"; exit 200; }
exit_create_new_document() { echo -n "$1"; exit 207; }
exit_show_tool_tip () { echo -n "$1"; exit 206; }

error_box() {
    mb=$(CocoaDialog ok-msgbox \
        --title "${KOMMIT_TITLE} - Error" \
        --text "$1" \
        --informative-text "$2" \
        --icon "x" \
        --float)
}

export KOMMIT_COMMAND
which_kommit_command_available() {
    if command -v kommit > /dev/null 2>&1; then
        KOMMIT_COMMAND="kommit"
    elif command -v git-kommit > /dev/null 2>&1; then
        KOMMIT_COMMAND="git-kommit"
    fi
}

is_kommit_available() {
    if command -v kommit > /dev/null 2>&1 || command -v git-kommit > /dev/null 2>&1; then
        which_kommit_command_available && return 0
    else
        error_box "Please install Kommit from GitHub." \
                  "Download at https://github.com/bilgi-webteam/kommit" &&
                  return 1
    fi
}

in_git_repo() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    else
        error_box "Please run this in git repo." \
                  "You must be in in a git repository" &&
                  return 1
    fi
}

