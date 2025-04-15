class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "738dd3153dd53c798de1a714bb4c139a464c069f07da0ffca3806f4842fb4442"
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
