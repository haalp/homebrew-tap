# mergeone v0.5.0 — sha256 values from the release's checksums.txt (signed keyless with Sigstore).
#   brew install haalp/tap/mergeone
class Mergeone < Formula
  desc "Merge gateway: typed decisions from a small model, a policy you own, pass/hold/block; never merges"
  homepage "https://mergeone.dev"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_arm64.tar.gz"
      sha256 "99f6d17559a6dd0bc74fd374ad217e28d06bc9917536fc211fdc0efd2565ba4f"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_amd64.tar.gz"
      sha256 "9411ce7e87680586a851e8dd79fbef91ecfe69b60099332e0acc74a11e227f24"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_arm64.tar.gz"
      sha256 "81c685c09fe785b0aa86419fe534583657740bcb3139432fd039985b95e00f74"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_amd64.tar.gz"
      sha256 "ce99b0cacf2ae581af109a38f82da5f172c50d9020742e9bbf14e1c18812a977"
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
