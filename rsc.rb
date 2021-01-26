class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.7.2"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "4819cb5ece7955395fc0f1bf35890692951563105875a3ebfbec87c6687f914d"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "de97d3389c050bba98e195ef13f5626f6665e7351d359ab3681beae14fe55798"
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
