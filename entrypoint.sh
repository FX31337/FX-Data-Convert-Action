#!/usr/bin/env bash

# Will cause a bash script to exit immediately when a command fails.
set -e

# Sets the exit code of a pipeline to that of the rightmost command
# to exit with a non-zero status.
set -o pipefail

# Treat unset variables as an error and exit immediately.
set -u

# Defines default variables.
verbose=0

# Implements on-exit trap function.
on_exit() {
  # @param $1 integer (optional) Exit status. If not set, use '$?'.
  local exit_status=${1:-$?}
  [ "$verbose" -eq 1 ] && echo "[INFO] $0 finishes with exit code $exit_status."
  exit "$exit_status"
}
# Implements on-error trap function.
on_error() {
  # @param $1 integer (optional) Exit status. If not set, use '$?'.
  local exit_status=${1:-$?}
  [ "$verbose" -eq 1 ] && echo "[ERROR] $0 finishes with exit code $exit_status!"
  get_backtrace >&2
  exit "$exit_status"
}
# Displays simple stack trace.
get_backtrace() {
  while caller $((n++)); do :; done
}

# Handle bash errors. Exit on error. Trap exit.
# Trap normal exit signal (exit on all errors).
trap on_exit EXIT

# Trap non-normal exit signals: 1/HUP, 2/INT, 3/QUIT, 15/TERM, ERR.
trap on_error 1 2 3 15 ERR

# Defines variables.
verbose="$( ! [ "${INPUT_LOGLEVEL:-0}" -gt 0 ]; echo $? )"
args=()
if [ -n "$INPUT_INPUTFILE" ]; then
  args+=( "$(printf -- "-i%s" "$INPUT_INPUTFILE")" )
fi

# Parse level of verbosity.
case "$INPUT_LOGLEVEL" in
1)
  args+=( "$(printf -- "%s" "-v")" )
  ;;
2)
  args+=( "$(printf -- "%s" "-v")" )
  args+=( "$(printf -- "%s" "-D")" )
  ;;
3)
  set -x
  args+=( "$(printf -- "%s" "-v")" )
  args+=( "$(printf -- "%s" "-D")" )
  ;;
"")
  # Pass-through.
  ;;
*)
  echo "[ERROR] Unknown log level: $INPUT_LOGLEVEL!"
  exit 1
  ;;
esac

# Parse the inputs and run the script.
case "$INPUT_INPUTFORMAT" in
csv)
  if [ -n "$INPUT_OUTPUTFORMAT" ]; then
    args+=( "$(printf -- "-f%s" "$INPUT_OUTPUTFORMAT")" )
  fi
  if [ -n "$INPUT_PAIR" ]; then
    args+=( "$(printf -- "-p%s" "$INPUT_PAIR")" )
  fi
  if [ -n "$INPUT_MODELINGMODE" ]; then
    args+=( "$(printf -- "-m%s" "$INPUT_MODELINGMODE")" )
  fi
  /opt/src/fx-data-convert-from-csv.py "${args[@]}" "$@"
  ;;
fxt | hcc | hst | hst509)
  if [ -n "$INPUT_INPUTFORMAT" ]; then
    args+=( "$(printf -- "-f%s" "$INPUT_INPUTFORMAT")" )
  fi
  /opt/src/fx-data-convert-to-csv.py "${args[@]}" "$@"
  ;;
"")
  echo "[ERROR] Please specify the input format!"
  exit 1
  ;;
*)
  echo "[ERROR] Unknown input format: $INPUT_INPUTFORMAT!"
  exit 1
  ;;
esac
