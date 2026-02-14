class Mae < Formula
  desc "Mail attachment extractor command-line tool"
  homepage "https://github.com/mrtazz/mae"
  url "https://github.com/mrtazz/mae/releases/download/0.1.2/mae.1", using: NoUnzipCurlDownloadStrategy
  sha256 "05e8dd606ce33f6939aca8fa8d470ba15d4dd161b031f7fdeac31368abc3b781"
  license "MIT"

  def self.version
    "0.1.2"
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
      checksum = "a74e6b4fae9eae76c07b23606a6ef02c425b4fe7483eb3eb092b084b39c1cb6a" if Hardware::CPU.arm?
    elsif OS.linux?
      checksum = "3c6766df01dd009c68a0062520c3c346e2c16abe10fc985d02ebc1795f1c614a"
    end
    checksum
  end

  def self.os_type
    type = ""
    type = "macos" if OS.mac?
    type = "linux" if OS.linux?
    type
  end

  resource "binary" do
    url "https://github.com/mrtazz/mae/releases/download/#{Mae.version}/mae-#{Mae.version}.#{Mae.os_type}.#{Mae.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Mae.binary_checksum
  end

  def install
    man1.install "mae.1"
    resource("binary").stage { bin.install "mae-#{Mae.version}.#{Mae.os_type}.#{Mae.arch}" => "mae" }
  end

  test do
    system "#{bin}/mae", "version"
  end
end
