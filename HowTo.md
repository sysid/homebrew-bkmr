# Homebrew Installation Guide for bkmr

This guide explains how to make your bkmr project installable via Homebrew.

## Prerequisites

1. Your project should be hosted on GitHub
2. You should have created a release with a version tag
3. You should be familiar with basic Git operations

## Step 1: Create a Personal Homebrew Tap

A "tap" is a repository of Homebrew formulas.

1. Create a new GitHub repository named `homebrew-bkmr` (replace `bkmr` with whatever you want)
2. Clone it locally:
   ```bash
   git clone https://github.com/yourusername/homebrew-bkmr.git
   cd homebrew-bkmr
   ```

## Step 2: Prepare Your Formula

1. Create a file named `bkmr.rb` in this repository with the content provided earlier
2. Replace placeholders:
   - Update the URL to point to your actual release
   - Generate the SHA256 hash of your release tarball:
     ```bash
     curl -L https://github.com/yourusername/bkmr/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
     ```
   - Replace `replace_with_actual_sha256_after_creating_release` with the generated hash

## Step 3: Commit and Push Your Formula

```bash
git add bkmr.rb
git commit -m "Add bkmr formula"
git push
```

## Step 4: Test Your Formula Locally

```bash
brew tap yourusername/bkmr
brew install bkmr
```

## Step 5: Submit to Homebrew Core (Optional)

If you want your formula to be included in the main Homebrew repository:

1. Fork the [Homebrew/homebrew-core](https://github.com/Homebrew/homebrew-core) repository
2. Add your formula to the appropriate location
3. Submit a pull request

Note: Homebrew Core has strict requirements for acceptance, including a minimum number of users and stars on GitHub.

## Usage

Users can install your application using:

```bash
# If using your personal tap
brew tap yourusername/bkmr
brew install bkmr

# If your formula is accepted into Homebrew Core
brew install bkmr
```

# Core .............................................................................................
The `bottle` block in a Homebrew formula specifies precompiled binaries for different platforms and macOS versions. These "bottles" allow users to install the software quickly without building it from source.

### Explanation of Each Part
```ruby
bottle do
  sha256 cellar: :any_skip_relocation, arm64_sequoia:  "b309ec7..."
  ...
end
```

- **`sha256`**: A SHA-256 checksum for verifying the integrity of the precompiled binary.
- **`cellar`**:
  - `:any_skip_relocation` means the binary doesn’t need to be relocated after installation (i.e., it's independent of its install path).
- **Platform keys** (e.g., `arm64_sequoia`, `ventura`, `x86_64_linux`):
  - These identify specific OS versions or CPU architectures.
  - Bottles are tailored for each target to ensure compatibility and optimized performance.

### Why Bottles Matter

- **Faster installs**: Avoids compilation.
- **Consistency**: Known-good builds with tested binaries.
- **Convenience**: Users don’t need build tools (like Rust in this case).

### When You Add a New Formula

For your own formula (e.g., `bkmr`), bottles are not required for submission to `homebrew-core`, but they will be automatically built and uploaded by maintainers after approval.


# Scratch ..........................................................................................
- clone homebrew/core, it's big
```bash
brew --repository homebrew/core
brew tap --force homebrew/core
...
The 4.4.0 release notes are available on the Homebrew Blog:
  https://brew.sh/blog/4.4.0
The 4.4.31 changelog can be found at:
  https://github.com/Homebrew/brew/releases/tag/4.4.31
==> Tapping homebrew/core
Cloning into '/opt/homebrew/Library/Taps/homebrew/homebrew-core'...
remote: Enumerating objects: 2610228, done.
remote: Counting objects: 100% (841/841), done.
remote: Compressing objects: 100% (399/399), done.
remote: Total 2610228 (delta 756), reused 448 (delta 442), pack-reused 2609387 (from 5)
Receiving objects: 100% (2610228/2610228), 909.37 MiB | 3.89 MiB/s, done.
Resolving deltas: 100% (1931659/1931659), done.
Updating files: 100% (7878/7878), done.
Tapped 4 commands and 7546 formulae (7,890 files, 1009.7MB).


➜  brew create https://github.com/sysid/bkmr/archive/refs/tags/v4.19.4.tar.gz
Formula name [bkmr]:
==> Downloading https://github.com/sysid/bkmr/archive/refs/tags/v4.19.4.tar.gz
==> Downloading from https://codeload.github.com/sysid/bkmr/tar.gz/refs/tags/v4.19.4
  #-=O=-#       #          #
Warning: Cannot verify integrity of 'eba223db539e3e401825635410ee6234d3ffaeb3db3e74b645e030ecb690bb1b--bkmr-4.19.4.tar.gz'.
No checksum was provided.
For your reference, the checksum is:
  sha256 "5f6ed78562e4e9c74a5890f1599b2b137da1b2f3a1032125de9baeddcc0546a4"
Please audit and test formula before submitting:
  HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --new bkmr
  HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug bkmr
  HOMEBREW_NO_INSTALL_FROM_API=1 brew test bkmr
Editing /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/b/bkmr.rb

# test build -> sandbox
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --interactive bkmr

# Install it
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug bkmr
# test it
brew test bkmr
# audit it
brew audit --new --formula bkmr
brew audit --strict bkmr

# Bump version locally
brew bump-formula-pr bkmr --url=https://github.com/sysid/bkmr/archive/refs/tags/v4.20.0.tar.gz
brew bump-formula-pr --help

# Create PR: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#commit
# https://docs.brew.sh/Formula-Cookbook#commit  !!!
# https://docs.brew.sh/How-To-Open-a-Homebrew-Pull-Request  !!!
git push https://github.com/sysid/homebrew-core/ bkmr  # -> https://github.com/Homebrew/homebrew-core/pull/220734
```

## Create Formula
[brew/docs/Formula-Cookbook.md](https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#std_cargo_args)
[brew/docs/Acceptable-Formulae.md](https://github.com/Homebrew/brew/blob/master/docs/Acceptable-Formulae.md)





# Examples .........................................................................................
[homebrew-core/Formula/h/halp.rb at master · Homebrew/homebrew-core · GitHub](https://github.com/Homebrew/homebrew-core/blob/master/Formula/h/halp.rb)
[homebrew-core/Formula/e/erdtree.rb at master · Homebrew/homebrew-core · GitHub](https://github.com/Homebrew/homebrew-core/blob/master/Formula/e/erdtree.rb)
