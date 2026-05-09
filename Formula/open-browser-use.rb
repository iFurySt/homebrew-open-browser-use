class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.21/open-browser-use-cli-0.1.21-darwin-arm64.tar.gz"
      sha256 "e958ef8db97633cc21dbc7891cca52e803c6ec37146067bdd3359e6d9ecf24af"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.21/open-browser-use-cli-0.1.21-darwin-amd64.tar.gz"
      sha256 "6dc853d08937b19f9c820d8f3430046541ccad9eb2a6014405571d1b01d784ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.21/open-browser-use-cli-0.1.21-linux-arm64.tar.gz"
      sha256 "efc63be12653a02dbc5391cb06e3049ed99404051bbdf5cc83fc579d1c8ca2cc"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.21/open-browser-use-cli-0.1.21-linux-amd64.tar.gz"
      sha256 "33633ccd1d3bda99a07dafa18d31d81604ef2d473f653f28a337f02ab3f37d88"
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
