class RestclientCpp < Formula
  desc "C++ client for making HTTP/REST requests"
  homepage "http://code.mrtazz.com/restclient-cpp/"
  url "https://github.com/mrtazz/restclient-cpp/archive/0.4.4.tar.gz"
  version "0.4.4"
  sha256 "f89355d4a635d35e19082078a86c18af8e05e033361d474b20d7b8589257d05d"

  depends_on "autoconf" => "build"
  depends_on "automake" => "build"
  depends_on "libtool"  => "build"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
