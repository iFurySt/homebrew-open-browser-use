class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.39/open-browser-use-cli-0.1.39-darwin-arm64.tar.gz"
      sha256 "1e140d1aa72aaed420c1a545153a2c71b7dd606741770fdecbfb9413e501a9cb"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.39/open-browser-use-cli-0.1.39-darwin-amd64.tar.gz"
      sha256 "81bcfe36b4d9dcfe1bedee4f1060863580e1169a245ea42af7ff9b4a04939c1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.39/open-browser-use-cli-0.1.39-linux-arm64.tar.gz"
      sha256 "9b14ac67305f31d86f977d299e3f051f331fa125ded0b1846941790aaecb48e0"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.39/open-browser-use-cli-0.1.39-linux-amd64.tar.gz"
      sha256 "edb2b6ddc9cf5ff09d7aa7371c3ed3873f1794cd9c3f5c9ebfa7026df13dd108"
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
