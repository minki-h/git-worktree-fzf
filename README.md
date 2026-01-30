# git-worktree-fzf (gwf)

An interactive Git worktree manager powered by fzf. Easily create, switch between, and delete Git worktrees with a beautiful fuzzy-finding interface.

## Quick Start

```bash
# 1. Install
brew tap minki-h/tap && brew install git-worktree-fzf

# 2. Add shell wrapper (required for directory switching)
# For Zsh - add to ~/.zshrc:
gwf() {
  local result=$(command gwf "$@")
  if [[ "$result" == CD:* ]]; then cd "${result#CD:}"; else echo "$result"; fi
}

# 3. Clone a repo for worktree workflow
gwf init myproject git@github.com:user/repo.git

# 4. Start working!
gwf                    # List & switch worktrees (interactive)
gwf add feature/login  # Create new worktree
gwf status             # See all worktrees at a glance
gwf rm feature/old     # Delete worktree
```

## Features

- 🔍 **Interactive worktree selection** with fzf
- ➕ **Create new worktrees** from existing or new branches
- 🗑️ **Delete multiple worktrees** at once
- 📊 **Status overview** - see dirty/clean state, ahead/behind for all worktrees
- 🔒 **Lock/Unlock** - protect worktrees from accidental deletion
- 🏠 **Bare repo workflow** - initialize projects optimized for worktrees
- 🎨 **Colorized output** for better readability
- ⌨️ **Tab completion** for Bash and Zsh
- 🚀 **Fast and lightweight** - just a Bash script

## Installation

### Via Homebrew

```bash
brew tap minki-h/tap && brew install git-worktree-fzf
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/minki-h/git-worktree-fzf.git
cd git-worktree-fzf

# Make the script executable
chmod +x bin/gwf

# Copy to your PATH (e.g., /usr/local/bin)
sudo cp bin/gwf /usr/local/bin/

# Optional: Install completions
# For Zsh
mkdir -p ~/.zsh/completions
cp completions/gwf.zsh ~/.zsh/completions/_gwf

# For Bash
cp completions/gwf.bash /usr/local/etc/bash_completion.d/
```

## Shell Integration

Since shell scripts can't change the parent shell's directory, you need to add a wrapper function to your shell configuration.

Add this to your `~/.zshrc` or `~/.bashrc`:

```bash
eval "$(gwf shell-init)"
```

After adding the wrapper, reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

## Usage

### List and Switch Worktrees

```bash
gwf          # Default action - list worktrees
gwf list     # Same as above
gwf ls       # Alias for list
```

This opens an interactive fzf menu showing all your worktrees. Select one to switch to it.

### Add New Worktree

```bash
gwf add      # Interactive branch selection
gwf new      # Alias for add
```

**Two modes:**

1. **Checkout existing branch**: Select a branch from the list to create a worktree for it
2. **Create new branch**: Type a new branch name to create a new branch and worktree

The worktree will be created as a sibling directory using the branch name (nested directories for `/`).

**Examples:**

- Select `feature/auth` → creates worktree at `../feature/auth`
- Type `bugfix/login` → creates new branch and worktree at `../bugfix/login`

### Delete Worktrees

```bash
gwf delete   # Interactive deletion
gwf rm       # Alias for delete
```

Select one or more worktrees (use Tab to select multiple) and confirm deletion.

### Status Overview

```bash
gwf status   # Show all worktrees with status indicators
```

Shows at a glance:
- ● Green = clean, Yellow = dirty, Red = missing
- ↑/↓ ahead/behind remote tracking branch
- 🔒 locked worktrees

### Current Worktree Info

```bash
gwf info     # Show detailed info about current worktree
```

### Initialize Bare Repo (Recommended Workflow)

```bash
gwf init myproject                              # Create new bare repo
gwf init myproject git@github.com:user/repo.git # Clone as bare repo
```

This creates a clean directory structure optimized for worktree workflow:
```
myproject/
  .bare/         <- bare repo (git data only)
  main/          <- main worktree (auto-detected default branch)
  feature/login/ <- additional worktrees go here
```

The default branch is auto-detected from the remote (main/master).

### Lock/Unlock Worktrees

```bash
gwf lock     # Lock a worktree (prevents accidental deletion)
gwf unlock   # Unlock a worktree
```

### Move Worktree

```bash
gwf move     # Move a worktree to a new path
```

### Maintenance Commands

```bash
gwf prune    # Remove stale worktree entries
gwf repair   # Repair worktree administrative files
gwf main     # Jump to main worktree (no fzf)
```

### Help and Version

```bash
gwf help     # Show help message
gwf version  # Show version number
```

## Dependencies

- **git** - Git version control
- **fzf** - Fuzzy finder for interactive selection

Install fzf via Homebrew:

```bash
brew install fzf
```

## How It Works

This tool wraps Git's `worktree` command with fzf for interactive selection:

| Command | Git Equivalent |
|---------|----------------|
| `gwf list` | `git worktree list \| fzf` |
| `gwf add` | `git worktree add` with branch selection |
| `gwf delete` | `git worktree remove` with multi-select |
| `gwf status` | `git worktree list` with status info |
| `gwf prune` | `git worktree prune` with preview |
| `gwf lock/unlock` | `git worktree lock/unlock` with fzf |
| `gwf move` | `git worktree move` with fzf |
| `gwf repair` | `git worktree repair` |
| `gwf init` | `git clone --bare` + initial worktree |

The shell wrapper function intercepts the output and performs the `cd` command when switching worktrees.

## Examples

### Create a worktree for a feature branch

```bash
gwf add
# Select or type: feature/new-api
# Creates: ../feature/new-api
# Automatically switches to that directory
```

### Switch between worktrees

```bash
gwf
# Select the worktree you want to work in
# Automatically switches to that directory
```

### Delete old worktrees

```bash
gwf delete
# Use Tab to select multiple worktrees
# Confirm deletion
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Credits

Inspired by common Git worktree workflows and powered by the excellent [fzf](https://github.com/junegunn/fzf) tool.
