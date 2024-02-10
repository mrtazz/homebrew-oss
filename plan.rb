class Plan < Formula
  desc "Cli tool for some planning tasks"
  homepage "https://github.com/mrtazz/plan"
  url "https://github.com/mrtazz/plan/releases/download/0.1.4/plan.1", using: NoUnzipCurlDownloadStrategy
  sha256 "2e59aaeb20339a73a7da6cd480bd5ad9ed8a6c4c4b3c4d0ea2c97d78f19f70d6"
  license "MIT"

  def self.version
    "0.1.4"
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
      checksum = "f77886db0989c574b4f0b2fb92a627896644cceb4cab6db880723b87f8b89346" if Hardware::CPU.arm?
      checksum = "948e0e12ad281c2195c2bc43000a85f5681be7b1e2f88abd326c793d86bd8fd8" if Hardware::CPU.intel?
    elsif OS.linux?
      checksum = "54a3fac1e63b2950cdf881383ed25d4b7cd08c6bdaefff35af7e291bed75f535"
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

