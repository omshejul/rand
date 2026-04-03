# rand

`rand` is a small Bash command that generates random alphanumeric strings using `openssl`.

## Features

- Default output length of 32 characters
- Custom length via `rand 16`
- Clipboard copy via `rand -c 24`
- Help aliases: `-h`, `--help`, `-help`, `help`
- Version aliases: `-v`, `--version`, `version`

## Requirements

- `bash`
- `openssl`
- `tr`
- `head`

Clipboard support is optional and uses the first available tool from:

- `pbcopy`
- `xclip`
- `wl-copy`

## Usage

```sh
rand
rand 16
rand -c 24
rand --help
rand --version
```

Example output:

```text
$ rand 16
f7u18Jsf6gaR9LpQ
```

## Local install

```sh
install -m 0755 bin/rand ~/.local/bin/rand
```

## Homebrew

This repo is structured so a Homebrew formula can install directly from a tagged source release tarball.

Formula template:

- [`packaging/homebrew/rand.rb`](packaging/homebrew/rand.rb)

Typical public setup:

1. Push this repo to `https://github.com/omshejul/rand`.
2. Tag and publish a release such as `v0.1.0`.
3. Create a tap repo such as `https://github.com/omshejul/homebrew-tools`.
4. Copy the formula template into the tap as `Formula/rand.rb`.
5. Replace the placeholder `sha256` in the formula with the release tarball checksum.

User install command:

```sh
brew install omshejul/tools/rand
```

## Release checklist

```sh
./test/test.sh
git tag v0.1.0
git push origin main --tags
```

After the release is published, update the `sha256` in the tap formula with:

```sh
curl -L https://github.com/omshejul/rand/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```

## License

MIT. See [`LICENSE`](LICENSE).
