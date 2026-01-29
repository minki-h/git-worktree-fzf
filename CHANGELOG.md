# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-01-29

### Added
- `gwf status` - Show all worktrees with dirty/clean state and ahead/behind counts
- `gwf info` - Display detailed information about current worktree
- `gwf prune` - Remove stale worktree entries with preview
- `gwf lock` - Lock a worktree to prevent accidental deletion (with fzf selection)
- `gwf unlock` - Unlock a worktree (with fzf selection)
- `gwf move` - Move a worktree to a new path (with fzf selection)
- `gwf repair` - Repair worktree administrative files
- `gwf main` - Jump directly to main worktree without fzf
- `gwf init` - Initialize bare repository for worktree workflow
  - Supports creating new bare repos or cloning existing repos
  - Automatically creates main worktree for default branch
- Additional color codes (BLUE, CYAN, BOLD, DIM) for enhanced output

### Changed
- Updated shell completions for new commands (Zsh and Bash)
- Enhanced help message with all new commands

## [1.0.0] - 2026-01-29

### Added
- Initial release
- `gwf list` command for interactive worktree selection with fzf
- `gwf add` command for creating new worktrees from existing or new branches
- `gwf delete` command for removing multiple worktrees
- Shell wrapper integration for directory switching
- Color-coded output for better UX
- Zsh completion support
- Bash completion support
- Homebrew formula for easy installation
- Comprehensive documentation (README, INSTALL, CONTRIBUTING)
- MIT License

### Features
- Interactive fuzzy finding with fzf
- Create worktrees from existing branches
- Create worktrees with new branches from any base point
- Multi-select deletion with confirmation
- Automatic folder naming (converts `/` to `_`)
- Dependency checking for git and fzf
- Git repository validation
- Command aliases (ls, new, rm)

[1.1.0]: https://github.com/minki-h/git-worktree-fzf/releases/tag/v1.1.0
[1.0.0]: https://github.com/minki-h/git-worktree-fzf/releases/tag/v1.0.0
