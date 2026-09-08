# SPDX-License-Identifier: Apache-2.0
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from marie_release import history, next_tag, title


class ReleaseNamesTest(unittest.TestCase):
    def test_first_release_and_title(self):
        with tempfile.TemporaryDirectory() as directory:
            tag = next_tag(Path(directory), "v4.37.0", "ang butter bread")
        self.assertEqual(tag, "v4.37.0-ver001-ang-butter-bread")
        self.assertEqual(title(tag), "v4.37.0-ver001-ang butter bread")

    def test_increment_across_base_versions(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "v4.37.0-ver001-ang-butter-bread.md").write_text("* Changes\n")
            self.assertEqual(
                next_tag(root, "v4.38.0", "brownie"), "v4.38.0-ver002-brownie"
            )
            with self.assertRaises(ValueError):
                next_tag(root, "v4.37.0", "cookie")

    def test_alphabet_wrap_and_no_reused_names(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for number in range(1, 27):
                dessert = chr(96 + number) + "-cake"
                (root / f"v4.37.0-ver{number:03d}-{dessert}.md").write_text(
                    "* Changes\n"
                )
            self.assertEqual(
                next_tag(root, "v4.37.0", "apple pie"), "v4.37.0-ver027-apple-pie"
            )
            with self.assertRaises(ValueError):
                next_tag(root, "v4.37.0", "a cake")

    def test_remote_draft_reserves_number_and_name(self):
        with tempfile.TemporaryDirectory() as directory:
            tag = next_tag(
                Path(directory),
                "v4.37.0",
                "brownie",
                ["v4.37.0-ver001-ang-butter-bread"],
            )
        self.assertEqual(tag, "v4.37.0-ver002-brownie")

    def test_gaps_bad_names_and_firmware_length(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for name in ("apple / pie", "apple pie with a very long name"):
                with self.assertRaises(ValueError):
                    next_tag(root, "v4.37.0", name)
            (root / "v4.37.0-ver002-brownie.md").write_text("* Changes\n")
            with self.assertRaises(ValueError):
                history(root)


if __name__ == "__main__":
    unittest.main()
