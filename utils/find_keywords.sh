#!/usr/bin/env bash
set -Ceu -o pipefail
# This script finds files that contains all the specified keywords.

cd ~/Desktop/swift-swift-5.6-RELEASE

find . -type f -print0 |
    xargs -0 pcregrep -e '\b__consuming\b' -I --files-with-matches |
    xargs pcregrep -e '\b__owned\b' -I --files-with-matches |
    xargs pcregrep -e '\b__shared\b' -I --files-with-matches |
    xargs pcregrep -e '\b__always\b' -I --files-with-matches
