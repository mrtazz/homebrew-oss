class Mae < Formula
  desc "Mail attachment extractor command-line tool"
  homepage "https://github.com/mrtazz/mae"
  url "https://github.com/mrtazz/mae/archive/refs/tags/0.1.0.tar.gz"
  sha256 "6098528c1abc15afcde03965c32d0394975fcefe2cb4e39e95375f3acbba2fe7"
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
