class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.26/open-browser-use-cli-0.1.26-darwin-arm64.tar.gz"
      sha256 "cbcb5fd8bedfaa76bdc97a1b2b19927d0f5950e91baf418ff534589d4c0b82bd"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.26/open-browser-use-cli-0.1.26-darwin-amd64.tar.gz"
      sha256 "dfcd149eba291ef0402043d0f3fda8f9ccf53229f3abec25b4a0542018185bc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.26/open-browser-use-cli-0.1.26-linux-arm64.tar.gz"
      sha256 "55a44738a8363a661ea8735e800772d64e1288d3955235da4b69147bb035949e"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.26/open-browser-use-cli-0.1.26-linux-amd64.tar.gz"
      sha256 "dbe0650db5b45944872bcdd49c54e5fe3d0e27215bc0f155b70841fdcfd9d98e"
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
