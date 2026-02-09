#!/bin/bash

# If your configuration directory is under source control, cloning this repo 
# directly to the home-assistant config directory is not feasable.
# Instead edit the HACONF variable to point to that config directory and run
# the script, this will overwrite any existing customisation.

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH=$(dirname "$(realpath -s "$0")")

if [ -f "$SCRIPTPATH/configuration.yaml" -o -f "$SCRIPTPATH/configuration.yml" ] ; then
    echo "Nothing to do. Themes building not supported here."
    exit 0
fi

"$SCRIPTPATH/install-cc.sh"
retVal=$?
if [ $retVal -ne 0 ]; then
    exit 1
fi

"$SCRIPTPATH/install-js-cards.sh"
retVal=$?
if [ $retVal -ne 0 ]; then
    exit 1
fi
