class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.31/open-browser-use-cli-0.1.31-darwin-arm64.tar.gz"
      sha256 "556163173f74e049580332d50ac1b863f3e915172a593733423581e9e549e693"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.31/open-browser-use-cli-0.1.31-darwin-amd64.tar.gz"
      sha256 "710616ca450ae6c6d13be49a25731b511eb773fdd02dad44de94ae53956546eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.31/open-browser-use-cli-0.1.31-linux-arm64.tar.gz"
      sha256 "2a11e07c604097b8d9e034b01e93d21ab4c472a515afb578fb63cef6a3dcb7d7"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.31/open-browser-use-cli-0.1.31-linux-amd64.tar.gz"
      sha256 "cf53528576fdd00e69b949582616c053fab183644141ec6e5604a5a470250ab0"
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
