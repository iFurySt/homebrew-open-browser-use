class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.25/open-browser-use-cli-0.1.25-darwin-arm64.tar.gz"
      sha256 "8ef2154fe09c17bd3ad0bc54ddb3a464699d44b2a2337c12bc32a3c451b5727e"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.25/open-browser-use-cli-0.1.25-darwin-amd64.tar.gz"
      sha256 "ac1c463c5c4168572e1e92e6aee47c604eb46492fa3f8d26df80b59860a81290"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.25/open-browser-use-cli-0.1.25-linux-arm64.tar.gz"
      sha256 "67779d88080cebd404d27a172da78119339b5347264763f89194e47f278b8fab"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.25/open-browser-use-cli-0.1.25-linux-amd64.tar.gz"
      sha256 "e3bbcadc53874417277d0f48717f1d44f674826de50cc18840bfcc4b9f6e6160"
    end
  end

  def install
    bin.install "open-browser-use"
    bin.install_symlink "open-browser-use" => "obu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/open-browser-use version")
    assert_match version.to_s, shell_output("#{bin}/obu version")
  end

  def caveats
    <<~EOS
      Run the following command to install:

        open-browser-use setup beta
    EOS
  end
end
