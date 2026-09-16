# Template for the Homebrew formula. The release workflow renders the __…__
# placeholders (version + per-arch sha256) and commits the result to the tap
# repo (ZKAI-Network/homebrew-loom) as Formula/loom.rb.
#
# Users then: brew install ZKAI-Network/loom/loom
class Loom < Formula
  desc "Loom command-line client"
  homepage "https://loom.mbd.xyz"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-arm64"
      sha256 "e62797c3cd97cf2068ecf8fd8b4b227f90f2901c89b36bad9e99a6c8c093eaff"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-x86_64"
      sha256 "1b3128e591a4a001fbab92622407b96b067c06f8a23830a94d53486a91f738d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-arm64"
      sha256 "35ce254edf8b4da52e382e0800f9ff681f3a8a5091e5438727ad593407c624bd"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-x86_64"
      sha256 "f0b3dbdef588dede8344203618811d679a0d640d8d6eaa157398e42496803d9e"
    end
  end

  def install
    bin.install Dir["loom-*"].first => "loom"
  end

  test do
    assert_match "loom", shell_output("#{bin}/loom --version")
  end
end
