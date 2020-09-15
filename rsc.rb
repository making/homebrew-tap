class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.6.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "0ef472c76bcded370a13e9abe4d368721e0a6d8f59cbbfd7267d1e3b4334c65d"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "455d82016949befe3d37fd0cd23cfdaafe1faf44a4164af37de4532fcfca8158"
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
