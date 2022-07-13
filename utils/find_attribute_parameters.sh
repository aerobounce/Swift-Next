#!/usr/bin/env bash
set -Ceu -o pipefail
# This script finds attributes with parameters used in .swift files.

cd ~/Desktop/swift-swift-5.6-RELEASE

pcregrep \
    --exclude-dir "\b(tools|utils|test|SILOptimizer|SILGen|IRGen|ClangImporter)\b" \
    --include "\.swift$" \
    --recursive \
    --no-filename \
    -o1 '(@(?!available)\b\w+\b\(.*\))' \
    . |
    sort |
    uniq
