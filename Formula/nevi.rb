class Nevi < Formula
  desc "Fast, Neovim-inspired terminal editor"
  homepage "https://github.com/anthonyamaro15/nevi"
  url "https://github.com/anthonyamaro15/nevi/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6613a3ea77859af29a7b720e2435d837b1e7ef791fe08cc9c74a91224dea5e39"
  license "MIT"
  head "https://github.com/anthonyamaro15/nevi.git", branch: "master"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Nevi creates its config files on first launch:
        ~/.config/nevi/config.toml
        ~/.config/nevi/languages.toml

      Optional LSP servers and tools can be installed separately.
      Run :checkhealth inside Nevi to inspect your setup.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nevi --version")
  end
end
