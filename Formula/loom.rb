# Template for the Homebrew formula. The release workflow renders the __…__
# placeholders (version + per-arch sha256) and commits the result to the tap
# repo (ZKAI-Network/homebrew-loom) as Formula/loom.rb.
#
# Users then: brew install ZKAI-Network/loom/loom
class Loom < Formula
  desc "Loom command-line client"
  homepage "https://loom.mbd.xyz"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-arm64"
      sha256 "410d70e42c33e98869ac39b0f8e17634e5ece90d484d9dfe241306745e7cb72b"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-darwin-x86_64"
      sha256 "05aca7be8125840fa3e81d0f280f9c689f40961234beeb92b5ff7bbd651e4d6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-arm64"
      sha256 "95439e1d7f17b12c618a5b046d0b35695dd02ba286736009654d4bbc1c1c2e32"
    end
    on_intel do
      url "https://github.com/ZKAI-Network/loom-cli/releases/download/v#{version}/loom-linux-x86_64"
      sha256 "188ebe086e0e8ccae4d8ccdbbf949d9ab21de0085dfb3e529ffce4ba576355c7"
    end
  end

  def install
    bin.install Dir["loom-*"].first => "loom"
  end

  test do
    assert_match "loom", shell_output("#{bin}/loom --version")
  end
end
