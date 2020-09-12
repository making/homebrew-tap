class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.5.1"

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "6014fa8d834a7c645a0b8066fee8f73dc0e9986eeb64880aeef3f93144c713ca"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "ea5b48d0ae7e0107a6ab6d557fefdc6d1583551bc79430d9428e550113837b52"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/rsc"
  end
end