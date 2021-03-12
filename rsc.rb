class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.9.0"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "dbd009f33fffe487688c0eb92276649209278b6bfe595ad7792408ed360580ee"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "c3c7b5340285c2b18b9f3da0da945320a540cbb8c54dbd683eef340ded50ffe9"
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
