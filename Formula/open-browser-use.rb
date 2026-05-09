class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-codex-browser-use"
  url "https://github.com/iFurySt/open-codex-browser-use/archive/refs/tags/v0.1.18.tar.gz"
  sha256 "25fb1726e3e038b459f8f00ffdd4bee9bcf20401876c3e56c996552ed58c4016"
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
      Run the following command to install:

        open-browser-use setup beta
    EOS
  end
end
