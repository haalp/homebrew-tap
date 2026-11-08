# haalp/homebrew-tap

Homebrew formulae for [mergeone](https://github.com/haalp/mergeone), the merge gateway.

```bash
brew install haalp/tap/mergeone
mergeone version
```

The formula pins each release's archives by the sha256 values in that release's `checksums.txt` (signed keyless with
Sigstore; `cosign verify-blob` instructions are in the release notes). It is updated when a `v*` tag of
`haalp/mergeone` publishes.
