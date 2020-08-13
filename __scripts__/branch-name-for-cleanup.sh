#!/usr/bin/env bash

manualInput=$1
branchName=$2

if [[ -z $manualInput ]]; then
    echo "$manualInput"
else
    echo "$branchName"
fi
