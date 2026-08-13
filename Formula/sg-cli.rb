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
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.1/sg-cli_Darwin_x86_64.tar.gz"
      sha256 "e44286978c3a368c02ad50939852eb0a5586eec3d319028a41ba91193ef0c805"
    end
    on_arm do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.1/sg-cli_Darwin_arm64.tar.gz"
      sha256 "37c3f3d20482dda91757387e658f5e8adf3194c20a4ee4e7dc985b6f3b5a1e92"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.1/sg-cli_Linux_x86_64.tar.gz"
      sha256 "09f47a04648bb974692e305b3d78c4467d98a9cb368356be5aaa401a5362c377"
    end
    on_arm do
      url "https://github.com/StackGuardian/sg-cli/releases/download/v2.2.1/sg-cli_Linux_arm64.tar.gz"
      sha256 "0839897684973f1b5d8edb5c009ce3b1ebedf759ab5d3c99fa49f96dcce3dcf1"
    end
  end

  def install
    bin.install "sg-cli"

    generate_completions_from_executable(bin/"sg-cli", "completion")
  end

  test do
    assert_match "sg-cli version #{version}", shell_output("#{bin}/sg-cli --version")
    assert_match "StackGuardian", shell_output("#{bin}/sg-cli --help")
  end
end
