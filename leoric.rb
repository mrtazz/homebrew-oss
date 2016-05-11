class Leoric < Formula
  desc "Project initialization from skeleton files"
  homepage "http://code.mrtazz.com/leoric/"
  url "https://github.com/mrtazz/leoric/archive/0.2.1.tar.gz"
  sha256 "43f880280af70a778ebd1dce978df643780bec7a3bc4014398ebd6104c794f40"

  depends_on "txt2man"

  def install
    system "PREFIX=#{prefix} make install"
  end

end
