class Plan < Formula
  desc "Cli tool for some planning tasks"
  homepage "https://github.com/mrtazz/plan"
  url "https://github.com/mrtazz/plan/releases/download/0.1.2/plan.1", using: NoUnzipCurlDownloadStrategy
  sha256 "68ee55f1868a330c1a4fc2bfcba4e691bdb47dc223089521fdc1f0aca1811b1f"
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
    checksum = "1f327401c0e86db4049550f355616954e4f5d237c1716fcd77a10138da2f3fab" if Hardware::CPU.arm?
    checksum = "6ff979f667a3da2ede256ceb9ae5684c3820d5b6acfcbd78655743f16345b1bb" if Hardware::CPU.intel?
    checksum
  end

  resource "binary" do
    url "https://github.com/mrtazz/plan/releases/download/#{Plan.version}/plan-#{Plan.version}.darwin.#{Plan.arch}", using: NoUnzipCurlDownloadStrategy
    sha256 Plan.binary_checksum
  end

  def install
    man1.install "plan.1"
    resource("binary").stage { bin.install "plan-#{Plan.version}.darwin.#{Plan.arch}" => "plan" }
  end

  test do
    system "#{bin}/plan", "version"
  end
end
