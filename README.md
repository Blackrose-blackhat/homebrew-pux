# Homebrew tap for Pux

[Pux](https://github.com/Blackrose-blackhat/pux) tells you why your build failed before you open GitHub.

## Install

The notch bar app for macOS 14+ (installs the `pux` CLI as a dependency):

```sh
brew install --cask Blackrose-blackhat/pux/pux-bar
```

The CLI only (macOS or Linux):

```sh
brew install Blackrose-blackhat/pux/pux
```

Then run `pux watch` inside a repository to start watching its CI. The notch bar picks the repository up automatically.

## First launch of Pux.app

The app is ad-hoc signed and not yet notarized, so macOS blocks the first launch. On macOS 15 or newer, open System Settings → Privacy & Security after the blocked launch and click "Open Anyway", or clear the quarantine flag:

```sh
xattr -d com.apple.quarantine /Applications/Pux.app
```

On macOS 14, right-click the app and choose Open also works.

## How this tap is updated

`Formula/pux.rb` and `Casks/pux-bar.rb` are bumped automatically by the [Update Homebrew tap](https://github.com/Blackrose-blackhat/pux/blob/main/.github/workflows/update-homebrew.yml) workflow in the main repository after each release. Do not edit the version or sha lines by hand.
