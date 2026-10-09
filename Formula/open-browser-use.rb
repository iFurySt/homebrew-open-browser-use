class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.0.0/open-browser-use-cli-1.0.0-darwin-arm64.tar.gz"
      sha256 "e72ec4a848da373bb459d7177dd9e0c4cc55a71eaa72a5a552d9205b00ad3b78"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.0.0/open-browser-use-cli-1.0.0-darwin-amd64.tar.gz"
      sha256 "88cbdfad066302cdd71bafd4249f34609280689b5115a77811a4d7abdad23965"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.0.0/open-browser-use-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "5d8e85418c2b6642f75a0667f712d06d673b11f2e545d946ba9576a0820efbb3"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.0.0/open-browser-use-cli-1.0.0-linux-amd64.tar.gz"
      sha256 "5737b38ccb6d5b824672f5c784e31eb12c2c42b66137a4daa2acf384b42e61e4"
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
