#compdef gwf

# Get list of branches (for add command)
_gwf_branches() {
  local -a branches
  branches=(${(f)"$(git branch -a 2>/dev/null | sed 's/.* //g' | sed 's/remotes\/origin\///' | sort -u)"})
  _describe -t branches 'branch' branches
}

# Get list of worktree branches (for delete/list commands)
_gwf_worktrees() {
  local -a worktrees
  worktrees=(${(f)"$(git worktree list 2>/dev/null | awk '{print $1}' | xargs -I{} basename {})"})
  _describe -t worktrees 'worktree' worktrees
}

# Get list of worktree branch names
_gwf_worktree_branches() {
  local -a branches
  branches=(${(f)"$(git worktree list 2>/dev/null | grep -oE '\[.*\]' | tr -d '[]')"})
  _describe -t branches 'worktree branch' branches
}

_gwf() {
  local -a subcommands
  subcommands=(
    'list:List and switch to a worktree'
    'ls:Alias for list'
    'add:Add a new worktree'
    'new:Alias for add'
    'delete:Delete one or more worktrees'
    'rm:Alias for delete'
    'status:Show status of all worktrees'
    'info:Show current worktree information'
    'prune:Remove stale worktree entries'
    'lock:Lock a worktree'
    'unlock:Unlock a worktree'
    'move:Move a worktree to a new path'
    'repair:Repair worktree administrative files'
    'main:Switch to main worktree'
    'init:Initialize bare repo for worktree workflow'
    'shell-init:Output shell integration wrapper function'
    'help:Show help message'
    'version:Show version information'
  )

  _arguments -C \
    '1: :->subcommand' \
    '*::arg:->args'

  case $state in
    subcommand)
      _describe -t subcommands 'gwf subcommand' subcommands
      # Also allow direct branch completion (gwf feature/xxx)
      _gwf_worktree_branches
      ;;
    args)
      case $words[1] in
        add|new)
          _gwf_branches
          ;;
        delete|rm)
          _gwf_worktree_branches
          ;;
        lock|unlock|move)
          _gwf_worktrees
          ;;
        init)
          _arguments '1:repo name:' '2:remote url:'
          ;;
      esac
      ;;
  esac
}

_gwf "$@"
