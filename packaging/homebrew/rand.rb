class Rand < Formula
  desc "Generate random alphanumeric strings"
  homepage "https://github.com/omshejul/rand"
  url "https://github.com/omshejul/rand/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ce9a8bd016fffd8eed3fb67fb5d3f2626c2a4fc1d86d1e3b189384ea9bc7ce69"
  license "MIT"

  def install
    bin.install "bin/rand"
  end

  test do
    output = shell_output("#{bin}/rand 16").strip
    assert_match(/\A[A-Za-z0-9]{16}\z/, output)
  end
end
