#!/usr/bin/env python3
import functools
import sys
from pathlib import Path

import re

first_float_re = re.compile(r"(\d+(?:\.\d+)?)")

def get_first_float(s: str) -> float:
    return float(first_float_re.search(s).group(1))

def path_sort_key(p: Path) -> tuple:
    name_first_float = get_first_float(p.name)
    # sort by: initial integer, then number of parts, then initial float, then by the path itself
    # this is so that files like 01.1-hello.txt come before test/dir/01-world.txt
    return (int(name_first_float), len(p.parts), name_first_float, str(p))


if __name__ == "__main__":
    files: list[Path] = [Path(p) for p in sys.argv[1:]]
    files.sort(key=path_sort_key)

    print(" ".join([str(p) for p in files]))
