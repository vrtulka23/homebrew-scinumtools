class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f86d21614ff9ff2d89cd729060fca789be8bcadf83b26ba36c3941db2c93a33b"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  
  def install
    system "sh", "setup.sh", "-b"
    include.install Dir["src/*"]
  end

  test do
    system "false"
  end
end
