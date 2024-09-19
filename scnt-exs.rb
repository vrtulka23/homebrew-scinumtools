class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "080e49cb9e5e16ca2bc1904d36a55f1d5f56c18071424291487da6e7c33a6229"
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
