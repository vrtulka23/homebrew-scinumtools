class Puq < Formula
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/puq-cpp"
  url "https://github.com/vrtulka23/puq-cpp/releases/download/v1.0.2/puq-v1.0.2.tar.gz"
  sha256 "719497254548072f647a85c932a770f0dd1eca1d130ea94157fa6d25fa4365d3"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "sh", "setup.sh", "-b"
    bin.install "build/puq"
  end

  test do
    system "puq", "-v"
  end
end
