#!/bin/bash

# If your configuration directory is under source control, cloning this repo 
# directly to the home-assistant config directory is not feasable.
# Instead edit the HACONF variable to point to that config directory and run
# the script, this will overwrite any existing customisation.

HACONF=../config

SUBFOLDER_CC=custom_components
SUBFOLDER_CC_INC=cc-include

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH=$(dirname "$(realpath -s "$0")")

cd "$SCRIPTPATH"

if [ -f "$SCRIPTPATH/configuration.yaml" -o -f "$SCRIPTPATH/configuration.yml" ] ; then
    echo "Nothing to do. Themes building not supported here."
    exit 0
fi

CONFDIR=$(realpath "$HACONF")

if ! [ -f "$CONFDIR/configuration.yaml" -o -f "$CONFDIR/configuration.yml" ] ; then
    >&2 echo "Configuration file not found in given directory!"
    exit 1
fi

if [ -d "$SCRIPTPATH/$SUBFOLDER_CC" ] ; then
    rsync -r --delete "$SCRIPTPATH/$SUBFOLDER_CC" "$CONFDIR"
    echo "Internal custom components folder copied."
    if [ -d "$CONFDIR/$SUBFOLDER_CC_INC" ] ; then
        rsync -r "$CONFDIR/$SUBFOLDER_CC_INC/" "$CONFDIR/$SUBFOLDER_CC"
        echo "Custom custom components folder added."
    fi
fi
