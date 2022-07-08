#!/usr/bin/env python3
# This script finds underscored attributes.

import re
from pathlib import Path

BASE_PATH = Path("~/Downloads/swift-swift-5.6-RELEASE").expanduser()
TARGET_FILES = [BASE_PATH / "docs/ReferenceGuides/UnderscoredAttributes.md"]
results: list[str] = []

for file in TARGET_FILES:
    with open(file) as buffer:
        lines = buffer.readlines()
        for line in lines:
            if matches := re.findall(r"@(_+\w+)", line):
                for match in [m for m in matches if m not in results]:
                    results.append(match)

for result in results:
    print(result)
