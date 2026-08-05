class SgCli < Formula
  desc "Manage resources on the StackGuardian platform"
  homepage "https://github.com/StackGuardian/sg-cli"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.0/sg-cli_Darwin_x86_64.tar.gz"
      sha256 "5071528a4d7d4ec79bf4942f84b89c0e00a3a6d070d15ec2c956db9fdad25c91"
    end
    on_arm do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.0/sg-cli_Darwin_arm64.tar.gz"
      sha256 "ada3f437d9944ae60e8532e26ca5d0bf75e916b4ca4ba2bd1f388a866c98823b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.0/sg-cli_Linux_x86_64.tar.gz"
      sha256 "05dfa78aa5b5ad7d26f913b0d691db933867b866cf4057f60014378eb3799e75"
    end
    on_arm do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.0/sg-cli_Linux_arm64.tar.gz"
      sha256 "30ce0749e7f5369f43857a54972e9e8548047db21818101a598fc677135283df"
    end
  end

  def install
    bin.install "sg-cli"
  end

  test do
    # Not asserting the version: the binary embeds it as a source constant
    # rather than taking it from the release tag, so v2.2.0 reports 2.1.0.
    # Tighten this once the version is injected at build time.
    assert_match "StackGuardian", shell_output("#{bin}/sg-cli --help")
  end
end
