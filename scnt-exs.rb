class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "23b4a036c6859ed664e5be906a94cc8ee458692f8b02e1ffec242371d4cc737c"
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
