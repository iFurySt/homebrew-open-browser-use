class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.38/open-browser-use-cli-0.1.38-darwin-arm64.tar.gz"
      sha256 "7b84f61d58f5d736d77495c54ea9ab1160684cc127a896f6340d37ac4a4b54e8"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.38/open-browser-use-cli-0.1.38-darwin-amd64.tar.gz"
      sha256 "78c35a80157b346c271b2bc4ee96ed221c82ad09696e931e8b9e075f58777c8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.38/open-browser-use-cli-0.1.38-linux-arm64.tar.gz"
      sha256 "d149252f693c7ef32c3e82e40ab2b07a29883989d455ab103bc166fda2a362d3"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.38/open-browser-use-cli-0.1.38-linux-amd64.tar.gz"
      sha256 "d763677eb3be433ecac5acee6df20a35c8c3ebd3d5858b0531932c596f89bead"
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
