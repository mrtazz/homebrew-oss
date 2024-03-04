class Plan < Formula
  desc "Cli tool for some planning tasks"
  homepage "https://github.com/mrtazz/plan"
  url "https://github.com/mrtazz/plan/releases/download/0.1.6/plan.1", using: NoUnzipCurlDownloadStrategy
  sha256 "f9ddbfd6f70e2d97ef93ac477b24c3283e8b0d0cf5df6b1cafc0be0280b12155"
  license "MIT"

  def self.version
    "0.1.6"
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
      checksum = "867e17bbe9aa0a1bff365955c27cf57ad6c2ba3eb28b1514057bd02515fe7d0f" if Hardware::CPU.arm?
      checksum = "a2095fed6a872f87400205bd970a1b3437531150e1747f89a5213851d784444c" if Hardware::CPU.intel?
    elsif OS.linux?
      checksum = "cbc519b68bda1f0eb009d8c9bd2bbbb65127fa3b0038e68744d834571ee16933"
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

