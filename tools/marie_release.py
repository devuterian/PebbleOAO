#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Prepare or validate Marie release names and handwritten release notes."""

import argparse
import re
import subprocess
from pathlib import Path

RELEASES = Path(__file__).resolve().parents[1] / "docs" / "releases"
TAG = re.compile(r"(v\d+\.\d+\.\d+)-ver(\d{3,})-([a-z]+(?:-[a-z]+)*)")


def history(directory, extra_tags=()):
    records = []
    tags = {path.stem for path in directory.glob("*.md")} | set(extra_tags)
    for tag in tags:
        match = TAG.fullmatch(tag)
        if match:
            records.append((int(match[2]), match[3], tag))
    records.sort()
    used = set()
    for expected, (number, dessert, tag) in enumerate(records, 1):
        if number != expected or dessert[0] != chr(97 + (number - 1) % 26):
            raise ValueError(f"Release sequence or dessert initial is invalid: {tag}")
        if dessert in used:
            raise ValueError(f"Dessert already used: {dessert}")
        used.add(dessert)
    return records


def next_tag(directory, base, dessert, extra_tags=()):
    if not re.fullmatch(r"v\d+\.\d+\.\d+", base):
        raise ValueError("Base must be the PebbleOS version, for example v4.37.0")
    dessert = dessert.strip().lower().replace(" ", "-")
    if not re.fullmatch(r"[a-z]+(?:-[a-z]+)*", dessert):
        raise ValueError("Use an English dessert name, separated by spaces or hyphens")
    records = history(directory, extra_tags)
    number = len(records) + 1
    initial = chr(97 + (number - 1) % 26)
    if dessert[0] != initial:
        raise ValueError(
            f"Release {number:03d} needs a dessert starting with {initial.upper()}"
        )
    if dessert in {record[1] for record in records}:
        raise ValueError(f"Dessert already used: {dessert}")
    tag = f"{base}-ver{number:03d}-{dessert}"
    # The firmware's version field holds 31 characters plus its terminator.
    if len(tag) > 31:
        raise ValueError(
            "Choose a shorter dessert so the complete firmware version fits 31 chars"
        )
    return tag


def title(tag):
    match = TAG.fullmatch(tag)
    if not match:
        raise ValueError(f"Invalid Marie release tag: {tag}")
    return f"{match[1]}-ver{match[2]}-{match[3].replace('-', ' ')}"


def remote_tags():
    def run(*args):
        return subprocess.check_output(args, text=True).strip()

    repo = run(
        "gh", "repo", "view", "--json", "nameWithOwner", "--jq", ".nameWithOwner"
    )
    releases = run(
        "gh", "api", f"repos/{repo}/releases", "--paginate", "--jq", ".[].tag_name"
    )
    tags = run("gh", "api", f"repos/{repo}/tags", "--paginate", "--jq", ".[].name")
    return releases.splitlines() + tags.splitlines()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    prepare = commands.add_parser("prepare")
    prepare.add_argument("--base", required=True)
    prepare.add_argument("--dessert", required=True)
    prepare.add_argument("--notes", type=Path, required=True)
    check = commands.add_parser("check")
    check.add_argument("tag")
    args = parser.parse_args()
    try:
        if args.command == "prepare":
            tag = next_tag(RELEASES, args.base, args.dessert, remote_tags())
            body = args.notes.read_text().strip()
            if not body:
                raise ValueError(
                    "Write the release's actual changes before preparing it"
                )
            RELEASES.mkdir(parents=True, exist_ok=True)
            with (RELEASES / f"{tag}.md").open("x") as output:
                output.write(body + "\n")
            print(tag)
        else:
            records = history(RELEASES)
            if args.tag not in {record[2] for record in records} or len(args.tag) > 31:
                raise ValueError("Tag must match a prepared release in docs/releases")
            if not (RELEASES / f"{args.tag}.md").read_text().strip():
                raise ValueError("Release notes cannot be empty")
            print(title(args.tag))
    except ValueError as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
