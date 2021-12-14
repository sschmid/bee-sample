#!/usr/bin/env bash

sample::_new() {
  echo '# sample'
  echo 'SAMPLE_GREETING="Hello from sample"
# secrets:
# SAMPLE_SECRET'
}

# Uncomment if this plugin should react to signals
# sample_int() {
#   echo "sample INT"
# }

# sample_term() {
#   echo "sample TERM"
# }

# sample_exit() {
#   echo "sample EXIT"
# }

# BEE_INT_TRAPS+=(sample_int)
# BEE_TERM_TRAPS+=(sample_term)
# BEE_EXIT_TRAPS+=(sample_exit)

sample::greeting() {
  echo "${SAMPLE_GREETING} (1.0.0)"
  local greeting="${BEE_RESOURCES}/sample/greeting.txt" sample_secret
  sample_secret="$(bee::secrets sample.secret)"
  assert_file greeting
  cat "${greeting}"
  echo "${sample_secret}"
}
