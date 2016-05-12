class Leoric < Formula
  desc "Project initialization from skeleton files"
  homepage "http://code.mrtazz.com/leoric/"
  url "https://github.com/mrtazz/leoric/archive/0.2.3.tar.gz"
  sha256 "45ac0e326d29dcb9eecf0933e4eabc46e5b21c59bc75db4e351ffa5bf4f7d02c"

  depends_on "pandoc"

  def install
    system "VERSION=0.2.3 PREFIX=#{prefix} make install"
  end

end
