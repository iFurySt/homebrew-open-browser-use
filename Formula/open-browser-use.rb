class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.37/open-browser-use-cli-0.1.37-darwin-arm64.tar.gz"
      sha256 "237aefeb2b0f489d4c665f02fff3c651d7c9f4a1ba43b4042608d0ca078615e3"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.37/open-browser-use-cli-0.1.37-darwin-amd64.tar.gz"
      sha256 "0023870051b605b3a1de07677b21f854d90a3ff419cd9c67ffa63b9a48e3d6e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.37/open-browser-use-cli-0.1.37-linux-arm64.tar.gz"
      sha256 "b7471d7d0f829a188a5629f3844996c48954d7803c80bebfb5efbedf64ed9650"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.37/open-browser-use-cli-0.1.37-linux-amd64.tar.gz"
      sha256 "ce67d6ea477f11844723cbe9c4de60bd3f9db12e13860fdc98e10476bb834a8c"
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
