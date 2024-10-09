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
  depends_on "python@3.x"
  depends_on "pybind11"
  
  def install
    # install scnt-puq
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
    # install pypuq
    ENV.prepend_path "PATH", Formula["python@3.x"].opt_bin 
    system "pip3", "install", "pypuq>=1.0" 
  end

  test do
    system "#{bin}/puq", "-v"
    system "python3", "-c", "import pypuq; print(pypuq.__version__)"
  end
end
