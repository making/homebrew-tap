class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.7.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "192948d8f518c249f67dd67b77f873286568b526d70fdb2cc10ec384b92b3726"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "9bf9e19077fa93e4774b892860cd3e3ca130441a20576a69b22d8a59243afcbb"
  end

  def install
    if OS.mac?
      mv "rsc-x86_64-apple-darwin", "rsc"
    elsif OS.linux?
      mv "rsc-x86_64-pc-linux", "rsc"
    end    
    bin.install "rsc"
  end

  test do
    system "#{bin}/rsc"
  end
end
