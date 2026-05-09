class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.23/open-browser-use-cli-0.1.23-darwin-arm64.tar.gz"
      sha256 "a1f164b6df25922b864a78170cf8fc91b56b120187f95a10d964f406010d6c53"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.23/open-browser-use-cli-0.1.23-darwin-amd64.tar.gz"
      sha256 "edd56a8dba3240c3e8de511e72347cf4d7c81320180169ccc417427638ce9df2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.23/open-browser-use-cli-0.1.23-linux-arm64.tar.gz"
      sha256 "f22beaad44c988c86acb1e049826d5af7458df5ef6b4c617118c048c17269c4d"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.23/open-browser-use-cli-0.1.23-linux-amd64.tar.gz"
      sha256 "d76b9ff3e6f1fc52fa8f715f67244c378a3f569c57116f91c5c12ff38f7c3491"
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
