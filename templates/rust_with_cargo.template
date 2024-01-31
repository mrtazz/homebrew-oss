class Snipple < Formula
  desc "Snippet managing support tooling for vim-snipple"
  homepage "https://github.com/mrtazz/snipple"
  url "https://github.com/mrtazz/snipple/archive/refs/tags/0.1.0.tar.gz"
  sha256 "2b47a1edb981c9bdf27e12126888ceae30461839493eec6db351ee3528c3c24f"
  license "MIT"

  depends_on "pandoc" => :build
  depends_on "rust" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/snipple", "version"
  end
end
