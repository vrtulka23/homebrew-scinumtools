class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ec76598a98e11b3cf2dc09cf714e8605aaeee1e6c01366d3ead5360dcf3381f6"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  depends_on "google-benchmark"
  depends_on "vrtulka23/scinumtools/scnt-exs"
  
  def install
    system "sh", "setup.sh", "-b"
    bin.install "build/puq"
  end

  test do
    system "puq", "-v"
  end
end
