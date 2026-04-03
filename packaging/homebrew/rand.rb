class Rand < Formula
  desc "Generate random alphanumeric strings"
  homepage "https://github.com/omshejul/rand"
  url "https://github.com/omshejul/rand/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4733cdb1ad33da05928db23a7e5de01822098f6659cbe19c9e3fa1e0803ab5ca"
  license "MIT"

  def install
    bin.install "bin/rand"
  end

  test do
    output = shell_output("#{bin}/rand 16").strip
    assert_match(/\A[A-Za-z0-9]{16}\z/, output)
  end
end
