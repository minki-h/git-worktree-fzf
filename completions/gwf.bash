#!/usr/bin/env bash

_gwf_completions() {
  local cur prev subcommands
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  subcommands="list ls add new delete rm status info prune lock unlock move repair main init help version"

  # Complete subcommands if we're on the first argument
  if [[ ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=( $(compgen -W "${subcommands}" -- ${cur}) )
    return 0
  fi

  # Handle init subcommand (directory completion for second arg)
  if [[ ${COMP_CWORD} -eq 2 && "${COMP_WORDS[1]}" == "init" ]]; then
    COMPREPLY=( $(compgen -d -- ${cur}) )
    return 0
  fi
}

complete -F _gwf_completions gwf
