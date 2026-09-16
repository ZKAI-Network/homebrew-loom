# Template for the Homebrew formula. The release workflow renders the __…__
# placeholders (version + per-arch sha256) and commits the result to the tap
# repo (ZKAI-Network/homebrew-loom) as Formula/loom.rb.
#
# Users then: brew install ZKAI-Network/loom/loom
class Loom < Formula
  desc "Loom command-line client"
  homepage "https://loom.mbd.xyz"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-arm64"
      sha256 "7c2295597aeaadb4647f93278b4dbf60654969a2fa37b9f2c9e53b99c472c690"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-x86_64"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-arm64"
      sha256 "04689d2073899b4159a6480184b7fcb249a21133c10b9a0be4a97ad149fa5b04"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-x86_64"
      sha256 "046cd7dff1120bc42ffdcde5a5c42cbaee493f97065404d6bf85ae61ba5c6112"
    end
  end

  def install
    bin.install Dir["loom-*"].first => "loom"
  end

  test do
    assert_match "loom", shell_output("#{bin}/loom --version")
  end
end
