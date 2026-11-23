#!/bin/bash
# SPDX-FileCopyrightText: 2026 PebbleOS contributors
# SPDX-License-Identifier: Apache-2.0
#
# Test merge upstream/main into origin/main and report the conflicts.
#
#   tools/marie_upstream_check.sh            # print the report
#   tools/marie_upstream_check.sh --notify   # also send it with tgsend when upstream moved
#
# Runs in its own detached worktree (MARIE_UPSTREAM_CHECK_DIR, default
# ~/.cache/marie-upstream-check) and always aborts the merge, so no checkout or
# branch changes.

set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
wt="${MARIE_UPSTREAM_CHECK_DIR:-$HOME/.cache/marie-upstream-check}"
notify=false
[ "${1:-}" = "--notify" ] && notify=true

git -C "$root" fetch -q upstream main
git -C "$root" fetch -q origin main

if [ ! -e "$wt/.git" ]; then
  mkdir -p "$(dirname "$wt")"
  git -C "$root" worktree add -q --detach "$wt" origin/main
fi
git -C "$wt" merge --abort 2>/dev/null || true
git -C "$wt" checkout -q --detach --force origin/main
git -C "$wt" clean -qfd

behind="$(git -C "$wt" rev-list --count --no-merges HEAD..upstream/main)"
if [ "$behind" = 0 ]; then
  echo "upstream: nothing new"
  exit 0
fi

conflicts=""
if ! git -C "$wt" -c user.name=check -c user.email=check@localhost \
  merge -q --no-commit --no-ff upstream/main >/dev/null 2>&1; then
  conflicts="$(git -C "$wt" diff --name-only --diff-filter=U)"
fi
git -C "$wt" merge --abort 2>/dev/null || true
git -C "$wt" checkout -q --detach --force origin/main

count=0
[ -n "$conflicts" ] && count="$(printf '%s\n' "$conflicts" | wc -l | tr -d ' ')"
since="$(git -C "$wt" log -1 --format=%cs "$(git -C "$wt" merge-base HEAD upstream/main)")"

report="PebbleOS 업스트림: 새 커밋 ${behind}개 (${since} 이후), 충돌 ${count}개"
if [ "$count" -gt 0 ]; then
  report+=$'\n'"$(printf '%s\n' "$conflicts" | head -n 15 | sed 's/^/- /')"
  [ "$count" -gt 15 ] && report+=$'\n'"- 외 $((count - 15))개"
fi
echo "$report"

if $notify && command -v tgsend >/dev/null 2>&1; then
  tgsend -m "$report" >/dev/null
fi
