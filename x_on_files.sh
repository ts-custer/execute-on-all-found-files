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
      $program "${file_entry}"
    fi

  done
}


program="${1}"
suffix="${2}"

if [ ${#} -ne 2 ]
then
  echo "Usage:    x_on_files.sh  <program>  <suffix>"
  exit 1
fi

execute_on_files_recursive "."




