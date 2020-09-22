#!/bin/sh

REF_BRANCH=$1
PACKAGE_RELATIVE_PATH=$2
CURRENT_PATH=$(pwd)
REF_TMP_PATH="/tmp/ref_co"

# Copy repo content to a temp location
cp -r $CURRENT_PATH $REF_TMP_PATH

# Checkout content of the reference branch
cd $REF_TMP_PATH && git co $REF_BRANCH

# Compare packages
## --ascii:             Only use ASCII symbols to display results
## --test:              Exit with `0` if package can be safely imported. Else, returns the number of errors
## --empty-config:      Check for values in the configuration elements: if so, exit with failure status.
## --reference_package: Reference package to compare your package with.
vro-diff --ascii --test --empty-config \
        --reference_package $REF_TMP_PATH/$PACKAGE_RELATIVE_PATH \
        $CURRENT_PATH/$PACKAGE_RELATIVE_PATH
