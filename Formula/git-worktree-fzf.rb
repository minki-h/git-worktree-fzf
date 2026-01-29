class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.1.0.tar.gz"
  sha256 "1e5c064bb46135fbc9a5e0618172fad6c743084a2842fb91cf70090edc88f0bf"
  license "MIT"
  version "1.1.0"

  depends_on "fzf"
  depends_on "git"

  def install
    bin.install "bin/gwf"

    # Install shell completions
    bash_completion.install "completions/gwf.bash" => "gwf"
    zsh_completion.install "completions/gwf.zsh" => "_gwf"
  end

  def caveats
    <<~EOS
      To enable directory switching, add this function to your shell config:

      For Zsh (~/.zshrc):
        gwf() {
          local result=$(command gwf "$@")
          if [[ "$result" == CD:* ]]; then
            cd "${result#CD:}"
          else
            echo "$result"
          fi
        }

      For Bash (~/.bashrc):
        gwf() {
          local result=$(command gwf "$@")
          if [[ "$result" == CD:* ]]; then
            cd "${result#CD:}"
          else
            echo "$result"
          fi
        }

      Then reload your shell:
        source ~/.zshrc  # or source ~/.bashrc
    EOS
  end

  test do
    assert_match "gwf version", shell_output("#{bin}/gwf version")
  end
end
