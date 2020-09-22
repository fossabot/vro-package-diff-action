#!/bin/sh

REF_TMP_PATH="/tmp/ref_co"

# Checkout content of the reference branch
if [ "$INPUT_REPO_TOKEN" = "" ]; then
    git clone -b $INPUT_BRANCH https://github.com/$GITHUB_REPOSITORY $REF_TMP_PATH
else
    git clone -b $INPUT_BRANCH https://$GITHUB_ACTOR:$INPUT_REPO_TOKEN@github.com/$GITHUB_REPOSITORY $REF_TMP_PATH
fi

# Compare packages
## --ascii:             Only use ASCII symbols to display results
## --test:              Exit with `0` if package can be safely imported. Else, returns the number of errors
## --empty-config:      Check for values in the configuration elements: if so, exit with failure status.
## --reference_package: Reference package to compare your package with.
vro-diff --ascii --test --empty-config \
        --reference_package $REF_TMP_PATH/$INPUT_PACKAGE_PATH $INPUT_PACKAGE_PATH
