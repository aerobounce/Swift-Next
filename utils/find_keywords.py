#!/usr/bin/env python3
# This script is to find files that contains all the specified keywords.

from multiprocessing import Pool
from pathlib import Path


SWIFT_REPO = Path("~/Downloads/swift-swift-5.6-RELEASE").expanduser()
PATTERNS: list[str] = [
    "__consuming",
    "__owned",
    "__shared",
    "__always",
]
IGNORED_EXTENSIONS: list[str] = [
    # ".swift",
    # ".h",
    # ".cpp",
    # ".sil",
    # ".rst",
    # ".md",
    # ".html",
]


def print_matching_file_path(path: Path):
    if path.is_file() and path.suffix not in IGNORED_EXTENSIONS:
        with open(path) as buffer:
            try:
                content = buffer.read()
                if all(pattern in content for pattern in PATTERNS):
                    return path
            except:
                pass


def main():
    with Pool(processes=4) as pool:
        path_list = [p for p in Path(SWIFT_REPO).rglob("*") if p.is_file()]

        for path in [p for p in pool.map_async(print_matching_file_path, path_list).get() if p]:
            print(path)


if __name__ == "__main__":
    main()
