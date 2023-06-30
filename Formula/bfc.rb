class Bfc < Formula
  desc "Braininf*ck Compiler/Interpreter"
  homepage "https://github.com/making/bfc"
  version "0.1.0-SNAPSHOT"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-apple-darwin"
    sha256 "8553e7682060b942b3e1904f7a061f8391ac7ef0bea0e307cbdcdb04d7c984f5"
  elsif OS.linux?
    url "https://github.com/making/bfc/releases/download/#{version}/bfc-x86_64-pc-linux"
    sha256 "6e8fd3dd152a51a6f10cfae1ba44af806ece59a44e0b45a1ecf612a0a736cb5a"
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
