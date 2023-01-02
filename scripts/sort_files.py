#!/usr/bin/env python3
import functools
import sys
from pathlib import Path
from typing import List

# import debugpy

# debugpy.listen(5678)
# debugpy.wait_for_client()


class NotAFileError(OSError):
    pass


def compare_filenames(p1: Path, p2: Path) -> int:
    if p1.stem > p2.stem:
        return 1
    elif p1.stem < p2.stem:
        return -1
    else:
        return 0


def sort_files(files: List[Path]) -> List[Path]:
    not_found: List[Path] = [p for p in files if not p.is_file()]

    if not_found:
        raise NotAFileError(f"Not files: {not_found}")

    return sorted(files, key=functools.cmp_to_key(compare_filenames))


if __name__ == "__main__":
    files: List[Path] = [Path(p) for p in sys.argv[1:]]
    sorted = sort_files(files=files)

    print(" ".join([str(p) for p in sorted]))
