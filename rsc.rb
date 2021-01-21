class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.7.1"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "a4194b850b50189e7e36e70973d45746abfc3b5f96bc6ccc5f659c4a22041deb"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "04a7f7c9c451038fdd0347c058323c73e3c93316e802cd23769ec17d0e3968cf"
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
