class ScntPuq < Formula
  include Language::Python::Virtualenv
  
  desc "Implementation of physical unit calculations in C++"
  homepage "https://github.com/vrtulka23/scnt-puq"
  url "https://github.com/vrtulka23/scnt-puq/archive/refs/tags/v1.3.12.tar.gz"
  sha256 "ac9c1e7d1bc62f388bd6a4f3403849d9300f430ee36d36df015874d3910c01fa"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "googletest"
  depends_on "google-benchmark"
  depends_on "vrtulka23/scinumtools/scnt-exs"
  depends_on "python@3"
  depends_on "virtualenv"
  
  #resource "pypuq" do
  #  url "https://files.pythonhosted.org/packages/30/04/735018d44effca0381bd750b6bafb706706c970361e4311a52427e0b7a16/pypuq-1.3.4.tar.gz"
  #  sha256 "c1dd98488e9f3d2abd86aaa90effeef104089aa4e5f5c02ce9a50bda2d6d024d"
  #end

  def install

    # Get code version
    env_file = "settings.env"
    if File.exist?(env_file)
      File.readlines(env_file).each do |line|
        line = line.sub(/^export\s+/, '')
        key, value = line.strip.split('=', 2)
        value = value.gsub(/\A["']|["']\Z/, '') if value
        ENV[key] = value if key && value
      end
    end
    
    # install scnt-puq
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCODE_VERSION=#{ENV['CODE_VERSION']}"
      system "make", "install"
    end
    
    # Install the Python package with pip
    #python = Formula["python"].opt_bin/"python3"
    #virtualenv_install_with_resources :using => "python@3"
    #system python, "-m", "pip", "install", "pypuq"
    # venv_dir = libexec/"vendor"
    # python_version = Language::Python.major_minor_version(python)
    # ENV.prepend_create_path "PYTHONPATH", venv_dir/"lib/#{python_version}/site-packages"    
    # resource("pypuq").stage do
    #   system python, "-m", "pip", "install", ".", "--prefix=#{venv_dir}", "--no-binary", ":all:"
    # end
  end

  test do
    system "#{bin}/puq", "-v"
    #system "python3", "-c", "import pypuq; print(pypuq.__version__)"
  end
end
