#!/usr/bin/env bash

set -euo pipefail

trap 'git clean -df force-app' EXIT

(
    set -x
    sf --version
    cat .forceignore
    find force-app
)

echo -e "\n---\n"

(
    set -x
    sf project retrieve start -m Profile:Admin -m Profile:Standard -m StandardValueSet:LeadStatus -m StandardValueSet:LeadSource
)

echo -e "\n---\n"

(
    set -x
    find force-app
)

echo -e "\n---\n"

if test -f force-app/main/default/profiles/Admin.profile-meta.xml || test -f force-app/main/default/standardValueSets/LeadStatus.standardValueSet-meta.xml; then
    echo "Reproduction of the issue successful!"
    echo "Some Metadata files were retrieved although they are ignored via .forceignore."
    echo "The output indicated that these files were not retrieved."
else
    echo "The issue could not be reproduced anymore."
    echo "This means it has been fixed. Thank you!"
    exit 1
fi
