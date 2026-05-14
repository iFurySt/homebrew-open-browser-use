class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.36/open-browser-use-cli-0.1.36-darwin-arm64.tar.gz"
      sha256 "2d4146ffd58253fb4ac03be1456ade12f378c8292e530f3387b786edbe4ac859"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.36/open-browser-use-cli-0.1.36-darwin-amd64.tar.gz"
      sha256 "f45c56af4537bebe4bdb8a2ea437f00527638c5d9cce8fc084924e3633adb8c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.36/open-browser-use-cli-0.1.36-linux-arm64.tar.gz"
      sha256 "34bca54393890b9b5227b88949680718cd9d186cd1fd4a94fc5766fb72449c87"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.36/open-browser-use-cli-0.1.36-linux-amd64.tar.gz"
      sha256 "1809a003ec011f35d934e70df6d5c464167c2c7570cb15dd20e0885bb2d9dedf"
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
