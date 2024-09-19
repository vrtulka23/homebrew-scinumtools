class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "f638c41984f9b285ed4d7cdccb06d1518c49fc169a010decf149b3ced7fbd129"
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
