#!/usr/bin/env bash

_gwf_branches() {
  git branch -a 2>/dev/null | sed 's/.* //g' | sed 's/remotes\/origin\///' | sort -u
}

_gwf_worktree_branches() {
  git worktree list 2>/dev/null | grep -oE '\[.*\]' | tr -d '[]'
}

_gwf_completions() {
  local cur prev subcommands
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  subcommands="list ls add new delete rm status info prune lock unlock move repair main init help version"

  # Complete subcommands if we're on the first argument
  if [[ ${COMP_CWORD} -eq 1 ]]; then
    # Include both subcommands and worktree branches for direct access
    local branches=$(_gwf_worktree_branches)
    COMPREPLY=( $(compgen -W "${subcommands} ${branches}" -- ${cur}) )
    return 0
  fi

  # Handle subcommand-specific completions
  case "${COMP_WORDS[1]}" in
    add|new)
      local branches=$(_gwf_branches)
      COMPREPLY=( $(compgen -W "${branches}" -- ${cur}) )
      return 0
      ;;
    delete|rm)
      local branches=$(_gwf_worktree_branches)
      COMPREPLY=( $(compgen -W "${branches}" -- ${cur}) )
      return 0
      ;;
    init)
      if [[ ${COMP_CWORD} -eq 2 ]]; then
        COMPREPLY=( $(compgen -d -- ${cur}) )
      fi
      return 0
      ;;
  esac
}

complete -F _gwf_completions gwf
