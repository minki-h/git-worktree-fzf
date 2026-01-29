#compdef gwf

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
    'help:Show help message'
    'version:Show version information'
  )

  _arguments -C \
    '1: :->subcommand' \
    '*::arg:->args'

  case $state in
    subcommand)
      _describe -t subcommands 'gwf subcommand' subcommands
      ;;
    args)
      case $words[1] in
        init)
          _arguments '1:repo name:' '2:remote url:'
          ;;
      esac
      ;;
  esac
}

_gwf "$@"
