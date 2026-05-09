class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  url "https://github.com/iFurySt/open-codex-browser-use/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "88326f81b320c5de4a32caf048d01ae2257a81b458edf01a47e286543dec268e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/open-browser-use"
    bin.install_symlink "open-browser-use" => "obu"
  end

  def post_install
    system opt_bin/"open-browser-use", "install-manifest", "--path", opt_bin/"open-browser-use"
  rescue => e
    opoo "Could not register the Chrome native messaging host automatically: #{e.message}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/open-browser-use version")
    assert_match version.to_s, shell_output("#{bin}/obu version")
  end

  def caveats
    <<~EOS
      Open Browser Use attempts to register the Chrome native messaging host during brew install.
      If the Chrome extension popup says the native host was not found, repair registration with:

        open-browser-use install-manifest
    EOS
  end
end
