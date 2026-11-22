# mergeone v0.7.1 — sha256 values from the release's checksums.txt (signed keyless with Sigstore).
#   brew install haalp/tap/mergeone
class Mergeone < Formula
  desc "Merge gateway: typed decisions from a small model, a policy you own, pass/hold/block; never merges"
  homepage "https://mergeone.dev"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_arm64.tar.gz"
      sha256 "fe203d9050a918e2896bbf4b3d30586eb6f9a535674cfccd2dab0cbbacb33350"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_amd64.tar.gz"
      sha256 "576cb780c8b1b473debc31202f8bf388f1d9cbad5f412007a88769e7c47a66a7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_arm64.tar.gz"
      sha256 "3ba13b4b25f6e740ae9094985818d0a9f867fec6926ab002eb741aae07f1ee64"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_amd64.tar.gz"
      sha256 "096f37e20d95d2941d100d4a97a40b9b796749572538b74f46a2b20481a0e032"
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
