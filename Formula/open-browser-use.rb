class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  url "https://github.com/iFurySt/open-codex-browser-use/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "881f81ccd357d08fa391b3e3edbc5bf4657a9f872e053c0ed97284941aaacf37"
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

      While the Chrome Web Store item is pending, install the latest release CRX with:

        open-browser-use setup release
    EOS
  end
end
