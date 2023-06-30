class Bfc < Formula
  desc "Braininf*ck Compiler/Interpreter"
  homepage "https://github.com/making/bfc"
  version "0.1.0-SNAPSHOT"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-apple-darwin"
    sha256 "f35f0d8393ecc53a29f18e02d60d98a9afaa2b680c9369184982b55e7d26c026"
  elsif OS.linux?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-pc-linux"
    sha256 "c91e93dbfe445bd07072abee73fa6deebb2416ae2fe3340df5a0854905962e2b"
  end

  def install
    if OS.mac?
      mv "bfc-x86_64-apple-darwin", "bfc"
    elsif OS.linux?
      mv "bfc-x86_64-pc-linux", "bfc"
    end
    bin.install "bfc"
    chmod 0755, "#{bin}/bfc"
  end

  test do
    system "#{bin}/bfc -h"
  end
end
