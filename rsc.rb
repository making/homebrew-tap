class Rsc < Formula
  desc "RSocket Client CLI (RSC)"
  homepage "https://github.com/making/rsc"
  version "0.8.0"

  depends_on :arch => :x86_64

  if OS.mac?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-apple-darwin"
    sha256 "47745cef5b03cba8bab7bea54f94fee5da35ebd6278faf1a0b2d4ba67be697f6"
  elsif OS.linux?
    url "https://github.com/making/rsc/releases/download/#{version}/rsc-x86_64-pc-linux"
    sha256 "987753eccf1e88aa0c83a74decc88a0c77be4463de33ae7933d18e05f55a5190"
  end

  def install
    if OS.mac?
      mv "rsc-x86_64-apple-darwin", "rsc"
    elsif OS.linux?
      mv "rsc-x86_64-pc-linux", "rsc"
    end    
    bin.install "rsc"
    output = Utils.safe_popen_read({ "SHELL" => "bash" }, bin/"rsc", "--completion", "bash")
    (bash_completion/"rsc").write output
    output = Utils.safe_popen_read({ "SHELL" => "bash" }, bin/"rsc", "--completion", "zsh")
    (zsh_completion/"_rsc").write output
    output = Utils.safe_popen_read({ "SHELL" => "bash" }, bin/"rsc", "--completion", "fish")
    (fish_completion/"rsc.fish").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/rsc -v"
  end
end
