class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.1.0/open-browser-use-cli-1.1.0-darwin-arm64.tar.gz"
      sha256 "280f63b29fb2d8371ce59918739df1d44ca8239da47b61dddee0f90ba169a9cf"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.1.0/open-browser-use-cli-1.1.0-darwin-amd64.tar.gz"
      sha256 "06e02a6f37e255e7cebfc74d8acbc270eaa94ca9f112e7fca2c13b3a167a299f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.1.0/open-browser-use-cli-1.1.0-linux-arm64.tar.gz"
      sha256 "fc1095d5d5d80a13fe2d0934c519f59bd7d98f710d561b4424e86a308ec74a39"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v1.1.0/open-browser-use-cli-1.1.0-linux-amd64.tar.gz"
      sha256 "9fdc551631806ef80f0cd219c50f2849e67430a085affac2741de2009a724039"
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
