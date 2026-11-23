#!/bin/bash
# SPDX-FileCopyrightText: 2026 PebbleOS contributors
# SPDX-License-Identifier: Apache-2.0
#
# Build environment for the Marie fork on macOS.
#
#   source tools/marie_env.sh            # set PATH and the venv for pbl, cmake and ctest
#   tools/marie_env.sh --install         # also install what is missing
#
# Installs the PebbleOS SDK named in SDK_VERSION to ~/pebbleos-sdk-<version>, dtc to
# ~/.local/bin when Homebrew has none, and requirements.txt into .venv.

_marie_root="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)"
_marie_sdk_version="$(head -n1 "$_marie_root/SDK_VERSION")"

_marie_missing() {
  local missing=()
  [ -x "$HOME/pebbleos-sdk-$_marie_sdk_version/arm-none-eabi/bin/arm-none-eabi-gcc" ] ||
    missing+=("sdk-$_marie_sdk_version")
  command -v dtc >/dev/null 2>&1 || missing+=("dtc")
  [ -x "$_marie_root/.venv/bin/python" ] || missing+=("venv")
  [ -x "$_marie_root/.venv/bin/python" ] &&
    ! "$_marie_root/.venv/bin/python" -c "import kconfiglib" 2>/dev/null && missing+=("requirements")
  echo "${missing[*]}"
}

_marie_install() {
  local missing
  missing="$(_marie_missing)"
  case " $missing " in *" sdk-$_marie_sdk_version "*)
    curl -LsSf "https://github.com/coredevices/PebbleOS-SDK/releases/download/v$_marie_sdk_version/pebbleos-sdk-installer.sh" |
      sh -s -- --version "$_marie_sdk_version" --prefix "$HOME/pebbleos-sdk-$_marie_sdk_version" --defaults ;;
  esac
  case " $missing " in *" dtc "*)
    # Homebrew can hang extracting bottles over SSH; build the small tool from source then
    local to=""
    command -v timeout >/dev/null 2>&1 && to="timeout 300"
    if ! HOMEBREW_NO_AUTO_UPDATE=1 $to brew install dtc </dev/null; then
      local src
      src="$(mktemp -d)"
      git clone -q --depth 1 --branch v1.7.2 https://github.com/dgibson/dtc.git "$src" &&
        make -C "$src" -j8 NO_PYTHON=1 NO_YAML=1 WARNINGS= dtc &&
        mkdir -p "$HOME/.local/bin" && cp "$src/dtc" "$HOME/.local/bin/dtc"
      mv "$src" "$HOME/.Trash/" 2>/dev/null
    fi ;;
  esac
  case " $missing " in *" venv "*)
    uv venv --python 3.12 "$_marie_root/.venv" ;;
  esac
  case " $missing " in *" venv "* | *" requirements "*)
    uv pip install -r "$_marie_root/requirements.txt" --python "$_marie_root/.venv/bin/python" ;;
  esac
}

if [ "$1" = "--install" ]; then
  _marie_install
fi

# CMake's FindPython takes the venv when VIRTUAL_ENV is set, instead of a newer system Python
# without the build's packages.
export VIRTUAL_ENV="$_marie_root/.venv"
export PATH="$_marie_root/.venv/bin:$HOME/.local/bin:/opt/homebrew/bin:$PATH"

_marie_left="$(_marie_missing)"
if [ -n "$_marie_left" ]; then
  echo "marie_env: missing $_marie_left; run tools/marie_env.sh --install" >&2
fi
unset _marie_left
