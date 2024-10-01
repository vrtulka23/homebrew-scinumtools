class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "fa4364786d4e16c318523de5ef6fdf138627509cad17616125ccdb1f506e6b6a"
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
