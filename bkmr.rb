class Bkmr < Formula
  desc "Bookmark manager for the terminal"
  homepage "https://github.com/sysid/bkmr"
  url "https://github.com/sysid/bkmr/archive/refs/tags/v4.17.1.tar.gz"
  sha256 "16d9a1c8c41ca434631686c405eec4f0ca42fd267b63139ea2979eaa006fbdef"
  license "BSD-3-Clause license" # Replace with your actual license
  depends_on "rust" => :build

  def install
    # Change to the directory containing Cargo.toml before building
    cd "bkmr" do
      #system "cargo", "install", "--locked", "--root", prefix, "--path", "."
      system "cargo", "install", "--verbose", "--locked", "--root", prefix, "--path", "."
    end

    # If you have bash completion in the bkmr subdirectory
    # bash_completion.install "bkmr/completions/bkmr.bash" if File.exist?("bkmr/completions/bkmr.bash")
  end

  test do
    # Add a simple test that verifies the executable runs
    assert_match "bkmr", shell_output("#{bin}/bkmr --help")
  end
end
