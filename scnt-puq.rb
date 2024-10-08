class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "08399c5487ca9fdc156623e43205c0cfaca592b24bc5d2d886912668b5f463f3"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  depends_on "google-benchmark"
  depends_on "vrtulka23/scinumtools/scnt-exs"
  depends_on "python@3.12"
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "puq", "-v"
  end
end
