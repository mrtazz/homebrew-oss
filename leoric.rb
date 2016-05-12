class Leoric < Formula
  desc "Project initialization from skeleton files"
  homepage "http://code.mrtazz.com/leoric/"
  url "https://github.com/mrtazz/leoric/archive/0.2.2.tar.gz"
  sha256 "9deb23d6633d553af82c0e00be5adf3feee95c4448e3958d6b069a51adb84894"

  depends_on "txt2man"

  def install
    system "PREFIX=#{prefix} make install"
  end

end
