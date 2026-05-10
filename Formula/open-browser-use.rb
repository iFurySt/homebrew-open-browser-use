class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.24/open-browser-use-cli-0.1.24-darwin-arm64.tar.gz"
      sha256 "1e8aabfdb110af7a492f36ad7d424bd207e577bedd8b3a514f9e2325ddbd91c7"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.24/open-browser-use-cli-0.1.24-darwin-amd64.tar.gz"
      sha256 "b03382517abb6313cf8581f50f1c679622b0220a6f6ee28357ddb72146a09e55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.24/open-browser-use-cli-0.1.24-linux-arm64.tar.gz"
      sha256 "3367ada795d43f478958d3b3705f99f0dc7609f27a4fd1b10c2ad1581517c78b"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.24/open-browser-use-cli-0.1.24-linux-amd64.tar.gz"
      sha256 "b6d971f95fabd00cdfc121209ddecf41d7969dd9f6207a65e08024aaa7c97f64"
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
