class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "425a4cbe50ed6c3dc4b2b1c4bef2ea7679ea2b1788a7b45f5507450afe9eeec8"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <scnt-exs/exs.h>
      int main() {
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-o", "test", "-I#{include}"
    system "./test"
    puts "Hello, testing is working"
  end
end
