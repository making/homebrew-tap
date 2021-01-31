class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.8.1"
  license "Apache-2.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "1e3ea4aab62e2f1cfb56fe00e38224e6f586ac797ff9b316a8c83643c7fc0627"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "6d02322f2cbf5d3bf7c01b3242ef14fa09bdab47136a9690bdce3ec2b87e6171"
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
