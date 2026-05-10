class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.27/open-browser-use-cli-0.1.27-darwin-arm64.tar.gz"
      sha256 "9185b12d44792eb48b7488895893db239ce06fc0361c292fca49ca28b450291c"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.27/open-browser-use-cli-0.1.27-darwin-amd64.tar.gz"
      sha256 "d52d091bbff4864ac1a2e347bbcb1e96b9f66000c8f58c7d0c696738c75a1c3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.27/open-browser-use-cli-0.1.27-linux-arm64.tar.gz"
      sha256 "21d1b42adb3cdf708af44e0ca0c371a092723912172bf7f8a838cfc6151285d8"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.27/open-browser-use-cli-0.1.27-linux-amd64.tar.gz"
      sha256 "722990b66f8cc489628305f5709e6084c9fb6468f4b1c619e8e1e93427c6e37e"
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
