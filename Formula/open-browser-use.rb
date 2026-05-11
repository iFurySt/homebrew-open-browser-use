class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.33/open-browser-use-cli-0.1.33-darwin-arm64.tar.gz"
      sha256 "bd6a54de6df9fe3192b34e7b8bee9143a9479f66c8f676b11a2f31065a7d8be9"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.33/open-browser-use-cli-0.1.33-darwin-amd64.tar.gz"
      sha256 "b9dc019a8f22938a68de08f936a1177220d379ca3499b777b3a660d9b62112d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.33/open-browser-use-cli-0.1.33-linux-arm64.tar.gz"
      sha256 "31f57ffa54c2170ef760b4db042e5a5105f46d8954094968f1f60be16c5fbbe0"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.33/open-browser-use-cli-0.1.33-linux-amd64.tar.gz"
      sha256 "e5e0be1288b5e4ee87c13cf0ec1795f505a39760ae2b92c9e65bc69e80892b23"
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

        open-browser-use setup
    EOS
  end
end
