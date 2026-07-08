class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.41/open-browser-use-cli-0.1.41-darwin-arm64.tar.gz"
      sha256 "9f3e0f1fd349f7b6e71a3bba59e50d61c7fc00172f5064fbba81764cbda65d56"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.41/open-browser-use-cli-0.1.41-darwin-amd64.tar.gz"
      sha256 "5abc84d57e1ae3e6e3d558a5caa551e70e4b0110728c1ddf7bc8c84049014f84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.41/open-browser-use-cli-0.1.41-linux-arm64.tar.gz"
      sha256 "8455a3746da01fbee18375e66e8b10d0786fc7755ec57ae63586a83b1ef8b145"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.41/open-browser-use-cli-0.1.41-linux-amd64.tar.gz"
      sha256 "abbde81c50d54fc3e858dd812f0a8603e556cd9b915ea05302b9e8135bd49622"
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
