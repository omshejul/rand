#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
rand_cmd="$repo_root/bin/rand"

assert() {
    local message="$1"
    shift
    if ! "$@"; then
        echo "FAIL: $message" >&2
        exit 1
    fi
}

output="$("$rand_cmd" 16)"
assert "rand 16 should return 16 characters" test "${#output}" -eq 16
assert "rand 16 should be alphanumeric only" bash -lc '[[ "$1" =~ ^[A-Za-z0-9]{16}$ ]]' _ "$output"

help_output="$("$rand_cmd" --help)"
assert "help should mention -v" grep -q -- "  -v" <<<"$help_output"
assert "help should mention clipboard" grep -q -- "Copy the generated string to the clipboard" <<<"$help_output"

version_output="$("$rand_cmd" --version)"
assert "version should be 0.1.0" test "$version_output" = "0.1.0"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT
ln -s "$(command -v bash)" "$tmpdir/bash"
ln -s "$(command -v openssl)" "$tmpdir/openssl"
ln -s "$(command -v tr)" "$tmpdir/tr"
ln -s "$(command -v head)" "$tmpdir/head"

copy_stdout="$tmpdir/copy.out"
copy_stderr="$tmpdir/copy.err"

if PATH="$tmpdir" bash "$rand_cmd" -c 8 >"$copy_stdout" 2>"$copy_stderr"; then
    echo "FAIL: rand -c should fail when no clipboard tool exists" >&2
    exit 1
fi

assert "copy failure should explain missing clipboard tools" grep -q -- "no clipboard tool found" "$copy_stderr"

echo "PASS"
