class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/puq-cpp"
  url "https://github.com/vrtulka23/puq-cpp/releases/download/v1.0.4/puq-v1.0.4.tar.gz"
  sha256 "b0951115dca0c11a4b85690051ca1d555b7fe838ff3e7c3f076b97405a238505"
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
