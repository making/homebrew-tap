class Bfc < Formula
  desc "Braininf*ck Compiler/Interpreter"
  homepage "https://github.com/making/bfc"
  version "0.1.0"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-apple-darwin"
    sha256 "d9d284beecb37f26bb830c0daba48fc5623985c6303b801c85dd5c05cc4d6593"
  elsif OS.linux?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-pc-linux"
    sha256 "1fc62e97f29208c16e28c128ed4d1aec66d10422b914ea75e41d12c058fe3e2e"
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
