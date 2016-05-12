class Leoric < Formula
  desc "Project initialization from skeleton files"
  homepage "http://code.mrtazz.com/leoric/"
  url "https://github.com/mrtazz/leoric/archive/0.2.2.tar.gz"
  sha256 "09a4c1c954b1a410cbbb7713b77a94af2f9762881482748a51015f2d97898f55"

  depends_on "txt2man"

  def install
    system "PREFIX=#{prefix} make install"
  end

end
