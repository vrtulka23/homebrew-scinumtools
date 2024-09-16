class ScntPuq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/puq-cpp"
  url "https://github.com/vrtulka23/puq-cpp/releases/download/v1.0.3/puq-v1.0.3.tar.gz"
  sha256 "8f92f914797cfc23a386f940bb85dc0cccf132ba3321ddda63e80b8fb121f8b8"
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
