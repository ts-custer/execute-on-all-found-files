#!/bin/bash


function execute_on_files_recursive() {
  directory="${1}"

  for file_entry in "${directory}"/*
  do

    if [ -d "${file_entry}" ]
    then
        execute_on_files_recursive "${file_entry}"
    elif [ -f "${file_entry}" ] && [[ "${file_entry}" =~ \.?${suffix}$ ]]
    then
      ${program} "${file_entry}" "${further_program_args}"
    fi

  done
}


function safety_break() {
  local x=$(shuf -i 1-9 -n 1)
  read -r -p "Enter '${x}' to proceed.. " INPUT
  if [ "${INPUT}" != "${x}" ] # user entered nothing or something else than x
  then
    echo "Execution stopped."
    exit 0
  fi
}


############ START:

program="${1}"
suffix="${2}"
further_program_args="${3}"

if [[ ${#} -lt 2 ]] || [[ ${#} -gt 3 ]]
then
  echo "Usage:    x_on_files.sh  program  suffix  [further program arguments]"
  exit 1
fi

echo "You are going to execute the following on all *${suffix} files that can be found in the current directory and its subdirectories recursively:"
echo "${program} *${suffix} ${further_program_args}"

safety_break

execute_on_files_recursive "."




