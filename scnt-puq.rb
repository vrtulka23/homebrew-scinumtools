class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "f7456c0d9727ef65745d0d7277b4366afa63ff02f45c1a9468126661a48a8a19"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  depends_on "google-benchmark"
  depends_on "vrtulka23/scinumtools/scnt-exs"
  depends_on "python@3.y"
  
  def install
    system "cmake", "..", *std_cmake_args
    system "make", "install"
  end

  test do
    system "puq", "-v"
  end
end
