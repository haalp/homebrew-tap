# mergeone v0.7.0 — sha256 values from the release's checksums.txt (signed keyless with Sigstore).
#   brew install haalp/tap/mergeone
class Mergeone < Formula
  desc "Merge gateway: typed decisions from a small model, a policy you own, pass/hold/block; never merges"
  homepage "https://mergeone.dev"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_arm64.tar.gz"
      sha256 "d004fd31d03d15bb64046ce7073812b20e49a9d9cd03463b3836b1d6df5ff84b"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_darwin_amd64.tar.gz"
      sha256 "27aab89b309375efd222503712e3612a5ff42509b7a5b44e314fc23529522ae8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_arm64.tar.gz"
      sha256 "7e60eb95cb3b7e115977990020add3eebc25a2d8dbe88dc31282f62b75893990"
    end
    on_intel do
      url "https://github.com/haalp/mergeone/releases/download/v#{version}/mergeone_linux_amd64.tar.gz"
      sha256 "0963d88bdc92fd9b04ac3b69dd1faf8bca9a33a696ef0ec0e6c5b9813b7a242d"
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
