class ScntExs < Formula
  desc "Implementation of expression solver in C++"
  homepage "https://github.com/vrtulka23/scnt-exs"
  url "https://github.com/vrtulka23/scnt-exs/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f95384d4b30a3ad8747255dc9cab0aae593fe595a92a4b7340d054a5e730f5db"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  
  def install
    system "sh", "setup.sh", "-b"
    include.install Dir["src/*"]
    (lib/"cmake/scnt-exs").install "build/scnt-exs-config.cmake", "build/scnt-exs-config-version.cmake" #, "build/MyLibraryTargets.cmake"
  end

  test do
    system "false"
  end
end
