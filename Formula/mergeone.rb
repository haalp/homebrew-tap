# mergeone v0.8.0 — sha256 values from the release's checksums.txt (signed keyless with Sigstore).
#   brew install haalp/tap/mergeone
class Mergeone < Formula
  desc "Merge gateway: typed decisions from a small model, a policy you own, pass/hold/block; never merges"
  homepage "https://mergeone.dev"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_arm64.tar.gz"
      sha256 "01494d840a63b748adcbca2f02e3efaeb0b7039561d734fed5b4cf3c89de46a7"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_amd64.tar.gz"
      sha256 "030e9f55e56416b05e4a55ac689e021e91f7d89bdb5d8c875d22f0f44a9afa19"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_arm64.tar.gz"
      sha256 "8a700759a8d63e16e3041d790f163a88fb6126af1db8f9dd4dd1ebc445cc466a"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_amd64.tar.gz"
      sha256 "1cc19fc0bbe0acca2027949460e5ecad8e7744aa1b90112275cb0b1ef00a0daa"
    end
  end

  def install
    bin.install Dir["mergeone_*"].first => "mergeone"
    pkgshare.install "assets"
  end

  def caveats
    <<~EOS
      Release assets (policy template, prompts, calibration maps) are in #{pkgshare}/assets:
        mergeone init --assets #{pkgshare}/assets
    EOS
  end

  test do
    assert_match "mergeone #{version}", shell_output("#{bin}/mergeone version")
  end
end
