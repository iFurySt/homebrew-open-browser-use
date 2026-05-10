class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.28/open-browser-use-cli-0.1.28-darwin-arm64.tar.gz"
      sha256 "82237dc2ba7f39a8910d8593903c8e7f65fdea4aaefc520e9e8d51dee7b59369"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.28/open-browser-use-cli-0.1.28-darwin-amd64.tar.gz"
      sha256 "bb5f795cecf29948722864bff76c6b02d996bcad3a156f890a8ce8e427996067"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.28/open-browser-use-cli-0.1.28-linux-arm64.tar.gz"
      sha256 "9c3f50e341a931f5267aff4cb7eb7106cd01d5d7ac9a55be0f801c30c705cd3b"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.28/open-browser-use-cli-0.1.28-linux-amd64.tar.gz"
      sha256 "40d5fb4835454eca8ab84a2e2ef70348450fcf83d83ca996c26a99596a788c4d"
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
