#!/bin/sh

project="${1}"

newest_version=$(curl -sLf https://api.github.com/repos/mrtazz/${project}/git/refs/tags | jq -r '. | last | .ref' | awk -F '/' '{ print $3 }')

if grep -q "${newest_version}" "${project}.rb"; then
  echo "Everything up to date for ${project}."
else
  echo "${project} needs to be updated to version ${newest_version}."
fi
