# mergeone v0.5.1 — sha256 values from the release's checksums.txt (signed keyless with Sigstore).
#   brew install haalp/tap/mergeone
class Mergeone < Formula
  desc "Merge gateway: typed decisions from a small model, a policy you own, pass/hold/block; never merges"
  homepage "https://mergeone.dev"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_arm64.tar.gz"
      sha256 "540cba9e16d14b4dfb574a9660b27900ed5f0ba4af80d55280bd60c2655a2746"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_amd64.tar.gz"
      sha256 "fcef76f56e4e03b1f2dfe61731daa25d3481df64b7ef8467220067e497f71168"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_arm64.tar.gz"
      sha256 "dd4df7aead2aa548522221914909f523e6e412d3babcb7edc636248091c144ba"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_amd64.tar.gz"
      sha256 "f391f174735fc4f249a4911265ab0e4fa6247e90e7b3f1572754caa39f95bd11"
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
