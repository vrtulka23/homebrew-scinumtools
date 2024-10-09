class ScntPuq < Formula
  include Language::Python::Virtualenv
  
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "08399c5487ca9fdc156623e43205c0cfaca592b24bc5d2d886912668b5f463f3"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  depends_on "google-benchmark"
  depends_on "vrtulka23/scinumtools/scnt-exs"
  depends_on "python@3"
  depends_on "pybind11"

  #resource "pypuq" do
  #  url "https://files.pythonhosted.org/packages/09/d2/04db104cda0777cd22c55f83e4f9a5ff586f3abc1ee1a47a065a02428e6d/pypuq-1.3.1.tar.gz"
  #  sha256 "d94a49ed535f10a55dff94c3d22b4faa916d6547a968db8929e92dffcd834e9d"
  #end
  
  def install
    # install scnt-puq
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
    # install pypuq
    #venv = virtualenv_create(libexec)
    #%w[pypuq].each do |r|
    #  venv.pip_install resource(r)
    #end
    #venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/puq", "-v"
    #system "python3", "-c", "import pypuq; print(pypuq.__version__)"
  end
end
