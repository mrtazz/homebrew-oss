class Leoric < Formula
  desc "Project initialization from skeleton files"
  homepage "http://code.mrtazz.com/leoric/"
  url "https://github.com/mrtazz/leoric/archive/0.2.3.tar.gz"
  sha256 "1cdca050f4d9e0c4baff339562bb8c38641d9211"

  depends_on "pandoc"

  def install
    system "VERSION=0.2.3 PREFIX=#{prefix} make install"
  end

end
