class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.34/open-browser-use-cli-0.1.34-darwin-arm64.tar.gz"
      sha256 "e5baa320e38c978ce774442c75321ca08acafd8a04635128c7dddd9e09c1f2a2"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.34/open-browser-use-cli-0.1.34-darwin-amd64.tar.gz"
      sha256 "727031de6480ed3c0defac372c4dbb900acdceca909b89b843fc4fe6ac06c79d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.34/open-browser-use-cli-0.1.34-linux-arm64.tar.gz"
      sha256 "fa2a97b53928523b5617bf7bab1c54dcf88b531dfcb2f76ec52ffb9c26282833"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.34/open-browser-use-cli-0.1.34-linux-amd64.tar.gz"
      sha256 "2f3ab6bd7c6c9dad5c3d72a8804af440581d6929adc09354b1ca4e252752ae56"
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
