#!/usr/bin/env python3
import sys
from pathlib import Path

import re

prefix_re = re.compile(r"^(-?\d+(?:\.\d+)?)-")


def get_prefix_float(s: str) -> float:
    searched = prefix_re.search(s)
    assert searched is not None, f"no prefix found in {s}"
    return float(searched.group(1))


def path_sort_key(p: Path) -> tuple:
    name_first_float = get_prefix_float(p.name)
    # sort by: initial integer, then number of parts, then initial float, then by the path itself
    # this is so that files like 01.1-hello.txt come before test/dir/01-world.txt
    return (int(name_first_float), len(p.parts), name_first_float, str(p))


def sort_files(input_files: list[Path]) -> list[Path]:
    return sorted(input_files, key=path_sort_key)


if __name__ == "__main__":
    print(" ".join([str(p) for p in sort_files([Path(p) for p in sys.argv[1:]])]))
