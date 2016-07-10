class Plustache < Formula
  desc "{{mustaches}} for C++"
  homepage "http://github.com/mrtazz/plustache/"
  url "https://github.com/mrtazz/plustache/archive/0.4.0.tar.gz"
  version "0.4.0"
  sha256 "83960c412a7c176664c48ba4d718e72b5d39935b24dc13d7b0f0840b98b06824"

  depends_on "autoconf" => "build"
  depends_on "automake" => "build"
  depends_on "libtool"  => "build"
  depends_on "boost"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
