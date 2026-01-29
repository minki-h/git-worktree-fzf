# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[1.0.0]: https://github.com/yourusername/git-worktree-fzf/releases/tag/v1.0.0
