class Nevi < Formula
  desc "Fast, Neovim-inspired terminal editor"
  homepage "https://github.com/anthonyamaro15/nevi"
  url "https://github.com/anthonyamaro15/nevi/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ce57794e1ccf7e24757186d92c1e0a60cc9acde6c415b32744dd6589f830f4fc"
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
