class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "1b2459864ea22d94b8eacc5229482e6324e762e6e24e307987c78dff9555acb9"
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
