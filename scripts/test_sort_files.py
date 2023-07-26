import unittest
from pathlib import Path
from sort_files import sort_files


class TestSortFiles(unittest.TestCase):
    barepaths = {
        Path("00-foo.txt"): 1,
        Path("01-bar.txt"): 2,
        Path("02-hello.txt"): 3,
        Path("03-world.txt"): 4,
        Path("04-foo.txt"): 5,
        Path("05-bar.txt"): 6,
        Path("06-baz.txt"): 7,
        Path("07-qux.txt"): 8,
        Path("08-quux.txt"): 9,
        Path("09-corge.txt"): 10,
    }
    decimalbarepaths = {
        Path("00.1-foo.txt"): 1,
        Path("01.1-bar.txt"): 2,
        Path("02.1-hello.txt"): 3,
        Path("03.1-world.txt"): 4,
        Path("04.1-foo.txt"): 5,
        Path("05.1-bar.txt"): 6,
        Path("06.1-baz.txt"): 7,
        Path("07.1-qux.txt"): 8,
        Path("08.1-quux.txt"): 9,
        Path("09.1-corge.txt"): 10,
    }
    dirpaths = {Path("test/dir") / p: i for p, i in barepaths.items()}
    decimaldirpaths = {Path("test/dir") / p: i for p, i in decimalbarepaths.items()}

    all_paths_dict = {}
    for d in barepaths, decimalbarepaths, dirpaths, decimaldirpaths:
        all_paths_dict.update(d)

    all_paths = list(all_paths_dict.keys())

    def test_should_not_change_already_sorted_list(self):
        res = sort_files(self.barepaths.keys())
        self.assertEqual(res, list(self.barepaths.keys()))
        res = sort_files(self.decimalbarepaths.keys())
        self.assertEqual(res, list(self.decimalbarepaths.keys()))
        res = sort_files(self.dirpaths.keys())
        self.assertEqual(res, list(self.dirpaths.keys()))
        res = sort_files(self.decimaldirpaths.keys())
        self.assertEqual(res, list(self.decimaldirpaths.keys()))

    def test_should_sort_properly(self):
        res = sort_files(self.all_paths)
        for i in range(len(res) - 1):
            original_index = self.all_paths_dict.get(res[i], None)
            self.assertIsNotNone(original_index)
            next_original_index = self.all_paths_dict.get(res[i + 1], None)
            if next_original_index is None:
                break
            if i == 0:
                # First item should always be the same as the next item
                self.assertEqual(original_index, next_original_index)
                continue
            if (i + 1) % 4 == 0:
                # Every fourth item should be the same as the next item
                self.assertLess(original_index, next_original_index)
            else:
                # Otherwise, the next item should be the same as the previous item
                self.assertEqual(original_index, next_original_index)

    def test_should_sort_negative_properly(self):
        path1 = Path("00-foo.txt")
        path2 = Path("-01-bar.txt")
        path3 = Path("02-hello.txt")
        res = sort_files([path1, path2, path3])
        self.assertEqual(res, [path2, path1, path3])

    # def test_sort_files(self):
    #     path1 = Path("/home/user/documents/02-world.txt")
    #     path2 = Path("/home/user/documents/01.1-hello.txt")
    #     sorted_paths = sorted([path1, path2], key=path_sort_key)
    #     self.assertEqual(sorted_paths, [path2, path1])

    # def test_sort_files_same_initial_integer(self):
    #     path1 = Path("/home/user/documents/01.2-hello.txt")
    #     path2 = Path("/home/user/documents/01.1-hello.txt")
    #     sorted_paths = sorted([path1, path2], key=path_sort_key)
    #     self.assertEqual(sorted_paths, [path2, path1])


if __name__ == "__main__":
    unittest.main()
