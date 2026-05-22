class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.40/open-browser-use-cli-0.1.40-darwin-arm64.tar.gz"
      sha256 "b3e5acbe80d77a6666d9372fa6e96f0a8ccc3184a7e351b7e61238828f39e6be"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.40/open-browser-use-cli-0.1.40-darwin-amd64.tar.gz"
      sha256 "9fcf013cc5ebb2b29e9685aa72c8d786f692fc5798b4a700d94450b02a3d67ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.40/open-browser-use-cli-0.1.40-linux-arm64.tar.gz"
      sha256 "9e8b0e0bf3829027079f498dbaf530926caeb66ba078217dec86a32d7aaaf483"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.40/open-browser-use-cli-0.1.40-linux-amd64.tar.gz"
      sha256 "061ac222f236a07723755bec1164f8ad096e162ae53d6b3c526fbea18930619a"
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
