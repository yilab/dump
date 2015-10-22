#!/bin/bash

version_key="version := \""

# TODO DRY these two
function get-version {
    version_key_len=`echo $version_key | wc -c`
    cat build.sbt | grep "$version_key" | cut -c ${version_key_len}- | rev | cut -c 2- | rev
}

function get-value-from-file {
    key="${1}"
    file="${2}"
    key_len=`echo ${key} | wc -c`
    cat "${file}" | grep "${key}" | cut -c ${key_len}-
}