class Snipple < Formula
  desc "Snippet managing support tooling for vim-snipple"
  homepage "https://github.com/mrtazz/snipple"
  url "https://github.com/mrtazz/snipple/releases/download/0.1.2/snipple.1", using: NoUnzipCurlDownloadStrategy
  sha256 "c805fa0f513cc4cb0cf158d4c26427e9085b40ed226bc864aad21c900d84c8ae"
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
      checksum = "1e197e134907427fa6dc6c68a83a569afe89c3cf836e55ee6cea9f66905b4b3c" if Hardware::CPU.arm?
    elsif OS.linux?
      checksum = "3012c41789d1fd0127c8412d11b7d78aa3b75af806f27a6cd9dcb876e7f16e56"
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
    url "https://github.com/mrtazz/snipple/releases/download/#{Snipple.version}/snipple-#{Snipple.version}.#{Snipple.os_type}.#{Snipple.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Snipple.binary_checksum
  end

  def install
    man1.install "snipple.1"
    resource("binary").stage { bin.install "snipple-#{Snipple.version}.#{Snipple.os_type}.#{Snipple.arch}" => "snipple" }
  end

  test do
    system "#{bin}/snipple", "version"
  end
end
