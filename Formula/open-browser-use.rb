class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.35/open-browser-use-cli-0.1.35-darwin-arm64.tar.gz"
      sha256 "89249d1037e7683ed0419176341ab96d32dd45ce8918234430d01a25b5641f43"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.35/open-browser-use-cli-0.1.35-darwin-amd64.tar.gz"
      sha256 "9832cdf99293fe92743c364ca186e9aa51e8d7944c579baded4318278292834a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.35/open-browser-use-cli-0.1.35-linux-arm64.tar.gz"
      sha256 "091ee529d1537f147a051d86ac278ad68ec18c449be1dded765d955751908757"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.35/open-browser-use-cli-0.1.35-linux-amd64.tar.gz"
      sha256 "5d0d9a693626279a1a1ef3027a598052eb08afdd3fd7079ab93051295ef3f211"
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
