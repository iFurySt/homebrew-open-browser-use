class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  url "https://github.com/iFurySt/open-codex-browser-use/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "adcf7c079eb0075038bbd737f56886268484e9521f056fcaf5dab4345f9b7a6e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/open-browser-use"
    bin.install_symlink "open-browser-use" => "obu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/open-browser-use version")
    assert_match version.to_s, shell_output("#{bin}/obu version")
  end

  def caveats
    <<~EOS
      Run setup after installation to register Chrome integration:

        open-browser-use setup

      While the Chrome Web Store item is pending, prepare the latest release zip for Load unpacked with:

        open-browser-use setup release
    EOS
  end
end
