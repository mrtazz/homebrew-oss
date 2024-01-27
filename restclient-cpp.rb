class RestclientCpp < Formula
  desc "C++ client for making HTTP/REST requests"
  homepage "http://code.mrtazz.com/restclient-cpp/"
  url "https://github.com/mrtazz/restclient-cpp/archive/0.5.2.tar.gz"
  version "0.5.2"
  sha256 "d62ba618f9a938652fd53b483289e8662a99451839e59058c8beb286dfbc65ec"

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
