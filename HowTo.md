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