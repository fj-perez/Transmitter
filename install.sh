#!/bin/bash

clear

#Requirements
# OS check
OS="$(uname)"
if [[ "${OS}" != "Darwin" ]]
then
  abort "Magnet Helper is only supported on macOS."
fi

#Shell check
if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi
#----------#

# string formatters
if [[ -t 1 ]]
then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

#Functions
abort() {
  printf "%s\n" "$@"
  exit 1
}

welcome() {
    printf "${tty_bold}${tty_underline}%s${tty_reset}\n\n" "$(shell_join "$@")"
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"
  do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}
#----------#

getc() {
  local save_state
  save_state="$(/bin/stty -g)"
  /bin/stty raw -echo
  IFS='' read -r -n 1 -d '' "$@"
  /bin/stty "${save_state}"
}

wait_for_user() {
  local c
  echo
  echo -n "  Press ${tty_bold}RETURN${tty_reset} to continue or any other key to abort:"
  getc c
  echo
  # we test for \r and \n because some stuff does \r instead
  if ! [[ "${c}" == $'\r' || "${c}" == $'\n' ]]
  then
    echo
    ohai "Maybe try again in a few minutes ?"
    exit 1
  fi
}

#Installer
printf "\t"
welcome "-- TRANSMITTER INSTALLER --"

ohai "This script will:"
printf "  1- Compile source code\n"
printf "  2- Config Info.plist\n"
printf "  3- Code-Sign app for local use\n"
printf "  4- Move app to the Application folder\n"

wait_for_user


if [[ -d "./Releases/Transmitter.app" ]]
then    
    rm -rf ./Releases/Transmitter.app
fi

osacompile -o "./Releases/Transmitter.app" "./src/TransmitterBrew.applescript"
cp ./src/Info.plist ./Releases/Transmitter.app/Contents/

codesign --verify --verbose ./Releases/Transmitter.app
codesign --force --sign - --timestamp=none ./Releases/Transmitter.app
codesign --verify --verbose ./Releases/Transmitter.app

# #xattr -lr ./Releases/Transmitter.app
# #xattr -cr ./Releases/Transmitter.app         

if [[ -d "/Applications/Transmitter.app" ]]
then    
    rm -rf /Applications/Transmitter.app
fi

cp -a ./Releases/Transmitter.app /Applications/Transmitter.app
open -a /Applications/Transmitter.app

echo
ohai "That's all!"