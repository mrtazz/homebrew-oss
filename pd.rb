class Pd < Formula
  desc "PagerDuty helper tooling"
  homepage "https://github.com/mrtazz/pd"
  url "https://github.com/mrtazz/pd/releases/download/0.1.1/pd.1", using: NoUnzipCurlDownloadStrategy
  sha256 "af61b99d2df7674efc450182d2fa3e8748375f9029bb22c67745d999397da873"
  license "MIT"

  def self.arch
    arch = ""
    arch = "arm64" if Hardware::CPU.arm?
    arch = "amd64" if Hardware::CPU.intel?
    arch
  end

  def self.binary_checksum
    checksum = ""
    checksum = "8a9c80d5df64f5bb965656fbaea118a73001398b84faa92baf8c4c2fcd4c3b9b" if Hardware::CPU.arm?
    checksum = "6e4586a8e4f4e28363ac48ab1a1bba3e3abdbd7b612b4697a7742aab602960a0" if Hardware::CPU.intel?
    checksum
  end

  resource "binary" do
    url "https://github.com/mrtazz/pd/releases/download/0.1.1/pd-0.1.1.darwin.#{Pd.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Pd.binary_checksum
  end

  def install
    man1.install "pd.1"
    resource("binary").stage { bin.install "pd-0.1.1.darwin.#{Pd.arch}" => "pd" }
  end

  test do
    system "#{bin}/pd", "version"
  end
end
