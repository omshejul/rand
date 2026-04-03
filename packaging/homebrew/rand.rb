class Rand < Formula
  desc "Generate random alphanumeric strings"
  homepage "https://github.com/omshejul/rand"
  url "https://github.com/omshejul/rand/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_RELEASE_TARBALL_SHA256"
  license "MIT"

  def install
    bin.install "bin/rand"
  end

  test do
    output = shell_output("#{bin}/rand 16").strip
    assert_match(/\A[A-Za-z0-9]{16}\z/, output)
  end
end
