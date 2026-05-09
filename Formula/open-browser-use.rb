class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.22/open-browser-use-cli-0.1.22-darwin-arm64.tar.gz"
      sha256 "87b5326617b20cdf0680d9ca36d2a9b9134da45bf63fc7455109fdf1570e34b0"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.22/open-browser-use-cli-0.1.22-darwin-amd64.tar.gz"
      sha256 "0014540ba2fea523c017e18f82b24821c05a48948b1c8cc260cfa3f02490c966"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.22/open-browser-use-cli-0.1.22-linux-arm64.tar.gz"
      sha256 "e0ecdb683c9f5d8883d4cbf9f4e5534119ebd2503d01947b4653cdf4258196a2"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.22/open-browser-use-cli-0.1.22-linux-amd64.tar.gz"
      sha256 "ca242e555836e89bbc6eb19dba8b7464fe13650093f55438ca7e6b4184765ee1"
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
