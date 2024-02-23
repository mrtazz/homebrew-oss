class Plan < Formula
  desc "Cli tool for some planning tasks"
  homepage "https://github.com/mrtazz/plan"
  url "https://github.com/mrtazz/plan/releases/download/0.1.5/plan.1", using: NoUnzipCurlDownloadStrategy
  sha256 "b16ddf38c20a5576f4a7a612f416bfd751d6aa1292b4e3e12bbe931ed9624372"
  license "MIT"

  def self.version
    "0.1.5"
  end

  def self.arch
    arch = ""
    arch = "arm64" if Hardware::CPU.arm?
    arch = "amd64" if Hardware::CPU.intel?
    arch
  end

  def self.os_type
    type = ""
    type = "darwin" if OS.mac?
    type = "linux" if OS.linux?
    type
  end


  def self.binary_checksum
    checksum = ""
    if OS.mac?
      checksum = "919918001793e72aa17e3088167e19b9f9a6ee3ad10fc597d2f5b167612ce69a" if Hardware::CPU.arm?
      checksum = "c3ccf184381bafea0eebfcb33f77e62698ea1888d5ed83e6efd2533cd8a1f0a7" if Hardware::CPU.intel?
    elsif OS.linux?
      checksum = "e0db38f43d1df0e746e807cbe64d4a4ba8f4165a2b82f9d21466b11a4a49ad8a"
    end
    checksum
  end

  resource "binary" do
    url "https://github.com/mrtazz/plan/releases/download/#{Plan.version}/plan-#{Plan.version}.#{Plan.os_type}.#{Plan.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Plan.binary_checksum
  end

  def install
    man1.install "plan.1"
    resource("binary").stage { bin.install "plan-#{Plan.version}.#{Plan.os_type}.#{Plan.arch}" => "plan" }
  end

  test do
    system "#{bin}/plan", "version"
  end
end

