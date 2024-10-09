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
  
  def pythons
    deps.map(&:to_formula)
      .select { |f| f.name.start_with?("python@") }
      .sort_by(&:version) # so scripts like `bin/f2py` use newest python
  end
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
    pythons.each do |python|
      python3 = python.opt_libexec/"bin/python"
      system python3, "-m", "pip", "install", "pypuq",
             *std_pip_args(build_isolation: true)
    end
  end

  test do
    system "puq", "-v"
  end
end
