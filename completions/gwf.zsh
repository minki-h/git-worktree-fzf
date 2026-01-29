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
  esac
}

_gwf "$@"
