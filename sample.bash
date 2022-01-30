sample::help() {
  cat << 'EOF'
This plugin comes with additional resources.
Please run 'bee res sample' to copy all required files to your project.

template:

  SAMPLE_GREETING="Hello from sample"

secrets:

  SAMPLE_SECRET

usage:

  greeting   print greetings

EOF
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

# bee::add_int_trap sample_int
# bee::add_term_trap sample_term
# bee::add_exit_trap sample_exit

# bee::remove_int_trap sample_int
# bee::remove_term_trap sample_term
# bee::remove_exit_trap sample_exit

sample::greeting() {
  echo "${SAMPLE_GREETING}"
  local greeting="${BEE_RESOURCES}/sample/greeting.txt"
  if [[ ! -f "${greeting}" ]]; then
    bee::log_error "${greeting} not found!"
    exit 1
  fi
  cat "${greeting}"
  echo "${SAMPLE_SECRET}"
}
