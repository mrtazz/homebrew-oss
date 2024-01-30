class Mae < Formula
  desc "Mail attachment extractor command-line tool"
  homepage "https://github.com/mrtazz/mae"
  url "https://github.com/mrtazz/mae/archive/refs/tags/0.1.1.tar.gz"
  sha256 "32b18b6765b9c3c11fa9f3fdf3c98c8244d83db7497a9fcbca1c0678b975fc97"
  license "MIT"

  depends_on "pandoc" => :build
  depends_on "rust" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/mae", "version"
  end
end
