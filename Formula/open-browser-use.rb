class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.29/open-browser-use-cli-0.1.29-darwin-arm64.tar.gz"
      sha256 "076e58fae3fd70065e13cccbe2b8b6d89d5e1e502d90e65d718126ed3314d40a"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.29/open-browser-use-cli-0.1.29-darwin-amd64.tar.gz"
      sha256 "6c0d40dea44fd631a9b04fc713dcfb9b4ccc26a313a283dbd663fe932f064b9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.29/open-browser-use-cli-0.1.29-linux-arm64.tar.gz"
      sha256 "7bced891e88dc499b31d3a9d0b577a3d2dfe1c166546ff23e0faf06253102c7f"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.29/open-browser-use-cli-0.1.29-linux-amd64.tar.gz"
      sha256 "ca869381dc72c40a3751d4bfd50e6cf2ed6b5a948acfc3b18c541c96c3308f53"
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
