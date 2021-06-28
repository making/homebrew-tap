class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.9.1"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "7c5b19aa9751d69a882a3002af27925db2f0879577c861fee7c609b5786c417e"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "ca704e8c7cca6ca6301f00cac4e8b47b0e0a292ed4bab6f4ac3474f052b5aaaa"
  end

  def install
    if OS.mac?
      mv "rsc-x86_64-apple-darwin", "rsc"
    elsif OS.linux?
      mv "rsc-x86_64-pc-linux", "rsc"
    end
    bin.install "rsc"
    chmod 0755, "#{bin}/rsc"
    output = Utils.safe_popen_read("#{bin}/rsc", "--completion", "bash")
    (bash_completion/"rsc").write output
    output = Utils.safe_popen_read("#{bin}/rsc", "--completion", "zsh")
    (zsh_completion/"_rsc").write output
    output = Utils.safe_popen_read("#{bin}/rsc", "--completion", "fish")
    (fish_completion/"rsc.fish").write output
  end

  test do
    system "#{bin}/rsc -v"
  end
end
