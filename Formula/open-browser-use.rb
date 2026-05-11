class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.30/open-browser-use-cli-0.1.30-darwin-arm64.tar.gz"
      sha256 "bd8b0d0e084f00e77310694f5af3d4b78f832b1d1492a8113b37ee964ce35bd5"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.30/open-browser-use-cli-0.1.30-darwin-amd64.tar.gz"
      sha256 "49ff08879ec5bcfe5b1f9ea20887e4c31eb8e7c101d3e4ef0fc4cbfff94525fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.30/open-browser-use-cli-0.1.30-linux-arm64.tar.gz"
      sha256 "5860ff3f3a55172e7998988ce7e0ffd65e183f25fbc7ba234dc7c8f66489f6bf"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.30/open-browser-use-cli-0.1.30-linux-amd64.tar.gz"
      sha256 "a0072392dca9455bbb6002e312e30f0065b0cef193c32e610261202adb2eb4bd"
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
