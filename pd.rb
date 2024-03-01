class Pd < Formula
  desc "PagerDuty helper tooling"
  homepage "https://github.com/mrtazz/pd"
  url "https://github.com/mrtazz/pd/releases/download/0.1.3/pd.1", using: NoUnzipCurlDownloadStrategy
  sha256 "fd5c5287b568cbcd25f7a11b65728f884ef9ef5466472e9708c7aad9bb0396b6"
  license "MIT"

  def self.version
    "0.1.3"
  end

  def self.arch
    arch = ""
    arch = "arm64" if Hardware::CPU.arm?
    arch = "amd64" if Hardware::CPU.intel?
    arch
  end

  def self.binary_checksum
    checksum = ""
    if OS.mac?
      checksum = "c31c5a57ffcfe34705183b1152d7fc7875b580fd7a7d1b7cc0cd92a852457683" if Hardware::CPU.arm?
      checksum = "38857ae49e678c05fff20055129a31185b4edaee558d90f8a49403810f2fb375" if Hardware::CPU.intel?
    elsif OS.linux?
      checksum = "920bead790778215e3d13be8f2818d2b0541919a4b61d7f66c4365cabf57a528"
    end
    checksum
  end

  def self.os_type
    type = ""
    type = "darwin" if OS.mac?
    type = "linux" if OS.linux?
    type
  end

  resource "binary" do
    url "https://github.com/mrtazz/pd/releases/download/#{Pd.version}/pd-#{Pd.version}.#{Pd.os_type}.#{Pd.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Pd.binary_checksum
  end

  def install
    man1.install "pd.1"
    resource("binary").stage { bin.install "pd-#{Pd.version}.#{Pd.os_type}.#{Pd.arch}" => "pd" }
  end

  test do
    system "#{bin}/pd", "version"
  end
end
