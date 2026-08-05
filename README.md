# StackGuardian Homebrew tap

Homebrew formulae for StackGuardian's command-line tools, for macOS and Linux.

```bash
brew tap StackGuardian/tap
```

## Available formulae

| Formula | What it is |
|---|---|
| `sg-cli` | Manages resources on the StackGuardian platform |
| `sg-dr` | Recovers StackGuardian-managed infrastructure when StackGuardian is unavailable |

```bash
brew install stackguardian/tap/sg-cli
brew install stackguardian/tap/sg-dr
```

Homebrew 6.0 wants trust before loading a tap outside its own. To settle that
up front rather than leaving it to Homebrew, and to scope the grant to one
formula rather than the whole tap:

```bash
brew trust --formula stackguardian/tap/sg-cli
```

## Verifying what you install

Formulae pin the SHA-256 of every archive, so Homebrew refuses anything that
does not match. The releases are signed as well, and for `sg-dr` — a tool meant
to be stored long before it is needed, and trusted when it is — verifying that
signature is worth doing at least once. The command is on its
[release page](https://github.com/StackGuardian/sg-dr/releases/latest).

## Older versions

Homebrew installs the current release and cannot install an arbitrary older one
from a formula. Every release commits a new formula here, so this repository's
git history holds them all, and a past version can be extracted into a tap of
your own:

```bash
brew extract --version=1.0.0 stackguardian/tap/sg-dr <your-tap>
```

For `sg-dr`, the signed archives on its
[releases page](https://github.com/StackGuardian/sg-dr/releases) are the better
way to obtain and keep a specific version.

## How this tap is maintained

Formulae are generated from each tool's published release checksums rather than
edited by hand, so the pinned hashes always match what was released. A
scheduled workflow watches for new releases and opens a pull request to bump
them, and `brew test-bot` installs and tests the formula on macOS and Linux
before it merges.
