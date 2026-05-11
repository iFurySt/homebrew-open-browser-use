class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  license "MIT"
  version "0.1.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.32/open-browser-use-cli-0.1.32-darwin-arm64.tar.gz"
      sha256 "09172f48562e8a5f5edfcfd78697177c05b04c59e08dc90e22ff8ac5064c356e"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.32/open-browser-use-cli-0.1.32-darwin-amd64.tar.gz"
      sha256 "10d41e5c2deb9f2f7b435878a0e48bbb6047cae23d1d28c95793a9bf33f55b6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.32/open-browser-use-cli-0.1.32-linux-arm64.tar.gz"
      sha256 "cae3209c2cdeda7d0b8d121db2f6f24d560a1d66c839e7983d2fd19fa9545b0b"
    else
      url "https://github.com/iFurySt/open-codex-browser-use/releases/download/v0.1.32/open-browser-use-cli-0.1.32-linux-amd64.tar.gz"
      sha256 "604b377b5df276b084a793b3300de7fb2e04af15161990ff60b9262d0203c5ea"
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
