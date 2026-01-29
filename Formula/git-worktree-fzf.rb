class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf.git", tag: "v1.3.2"
  license "MIT"
  head "https://github.com/minki-h/git-worktree-fzf.git", branch: "main"

  depends_on "fzf" => :recommended

  def install
    bin.install "bin/gwf"
    bash_completion.install "completions/gwf.bash" => "gwf"
    zsh_completion.install "completions/gwf.zsh" => "_gwf"
  end

  def caveats
    <<~EOS
      To enable directory switching, add this to your shell config:

      gwf() {
        local result=$(command gwf "$@")
        if [[ "$result" == CD:* ]]; then
          cd "${result#CD:}"
        else
          echo "$result"
        fi
      }
    EOS
  end

  test do
    assert_match "gwf version", shell_output("#{bin}/gwf version")
  end
end
