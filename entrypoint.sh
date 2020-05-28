#!/usr/bin/env bash

# Will cause a bash script to exit immediately when a command fails.
set -e

# Sets the exit code of a pipeline to that of the rightmost command
# to exit with a non-zero status.
set -o pipefail

# Treat unset variables as an error and exit immediately.
set -u

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
