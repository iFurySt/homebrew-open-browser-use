class OpenBrowserUse < Formula
  desc "Browser automation native host and CLI"
  homepage "https://github.com/iFurySt/open-browser-use"
  license "MIT"
  version "0.1.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.42/open-browser-use-cli-0.1.42-darwin-arm64.tar.gz"
      sha256 "18619cd0c3011752603b7fd6f5c1ad7fe25d0acd4e8fb8a0549e0729bb1fac6e"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.42/open-browser-use-cli-0.1.42-darwin-amd64.tar.gz"
      sha256 "b46e85ae15c8d433b14052229b742efc9b5b4cb546a35b73f5d5cffbe03b0dd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.42/open-browser-use-cli-0.1.42-linux-arm64.tar.gz"
      sha256 "974ccfacb366cfe44a9b276413f58997f6c731e11870141cdd8cfdeee3ca616a"
    else
      url "https://github.com/iFurySt/open-browser-use/releases/download/v0.1.42/open-browser-use-cli-0.1.42-linux-amd64.tar.gz"
      sha256 "f3701e02b078e66b1709b09287b1ec081f2ee9fe849b63099ba429e424011149"
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
