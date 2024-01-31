class Pd < Formula
  desc "PagerDuty helper tooling"
  homepage "https://github.com/mrtazz/pd"
  url "https://github.com/mrtazz/pd/releases/download/0.1.2/pd.1", using: NoUnzipCurlDownloadStrategy
  sha256 "e69edc54114833d5664dd988ab5206ad71617b3c78a5df79d54653327d927209"
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
      checksum = "1fb004711e10959eeaf63d1ad7439f024a1ad6e8ddfcc769cef938effa68d962" if Hardware::CPU.arm?
      checksum = "8b8172303ed5883063b274cf55d9db83f1b96008f301839ed52181eaeb637ede" if Hardware::CPU.intel?
    elsif OS.linux?
      checksum = "77593421d1bf58eaade795c311b120a276fb2bc868e127b6272421a7f7ca7b58"
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
