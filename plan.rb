class Plan < Formula
  desc "Cli tool for some planning tasks"
  homepage "https://github.com/mrtazz/plan"
  url "https://github.com/mrtazz/plan/releases/download/0.1.3/plan.1", using: NoUnzipCurlDownloadStrategy
  sha256 "5699b15e032bc9a83a13af962a0d26bd99a727f57a8dd6d3121c6431397207f2"
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
    checksum = "cf2dbe7a9eadf19ac0a77d1d1e9014891b1e6b97c03859d79eff419effbaf456" if Hardware::CPU.arm?
    checksum = "aa263eaa743afb3c8136166a7fcf899547fd257b0519dbc0a1f77bdd93ffed49" if Hardware::CPU.intel?
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

