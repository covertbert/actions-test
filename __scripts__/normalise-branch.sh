#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage:"
    echo -e "\t./normalise-branch.sh feature/add-a-new-button-2020"
    exit 1
fi

# Valid CNAMEs are lowercase with no leading or trailing hyphens
# Valid CloudFormation stacks must start with a letter

normalise() {
    
    local normalised
    #          remove feature/   allow only wanted characters       convert upper -> lower
    normalised=$(echo "${1##*/}" | tr -dc '[0-9][:alpha:][=-=]\n\r' | tr '[:upper:]' '[:lower:]')

    # remove trailing hyphens, then leading numbers and hyphens
    # shellcheck disable=SC2001
    normalised=$(shopt -s extglob; echo "${normalised%%+(\-)}" | sed 's/^[0-9\-]*//' )

    echo "${normalised}"
}

normalise "${1}"