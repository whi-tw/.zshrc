#!/usr/bin/env python3
import functools
import sys
from pathlib import Path


def path_sort_key(p: Path) -> tuple:
    return (p.name, len(p.parts), str(p))


if __name__ == "__main__":
    files: list[Path] = [Path(p) for p in sys.argv[1:]]
    files.sort(key=path_sort_key)

    print(" ".join([str(p) for p in files]))
