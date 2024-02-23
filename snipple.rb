class Snipple < Formula
  desc "Snippet managing support tooling for vim-snipple"
  homepage "https://github.com/mrtazz/snipple"
  url "https://github.com/mrtazz/snipple/archive/refs/tags/0.1.1.tar.gz"
  sha256 "047555ca0f4f946a04c468e8b73019c3e69cd5478521176ad96b04146ff31633"
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
