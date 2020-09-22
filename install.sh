#!/bin/bash

# If your configuration directory is under source control, cloning this repo 
# directly to the home-assistant config directory is not feasable.
# Instead edit the HACONF variable to point to that config directory and run
# the script, this will overwrite any existing customisation.

HACONF=../config

SUBFOLDER_CC=custom_components
SUBFOLDER_WWW=www
SUBFOLDER_WWW_INC=www-include

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH=$(dirname "$(realpath -s "$0")")

cd "$SCRIPTPATH"

if [ -f "$SCRIPTPATH/configuration.yaml" -o -f "$SCRIPTPATH/configuration.yml" ] ; then
    echo "Nothing to do."
    exit 0
fi

CONFDIR=$(realpath "$HACONF")

if ! [ -f "$CONFDIR/configuration.yaml" -o -f "$CONFDIR/configuration.yml" ] ; then
    echo "Configuration file not found in given directory!"
    exit 1
fi

if [ -d "$SCRIPTPATH/$SUBFOLDER_CC" ] ; then
    rsync -vr --delete "$SCRIPTPATH/$SUBFOLDER_CC" "$CONFDIR"
fi
if [ -d "$SCRIPTPATH/$SUBFOLDER_WWW" ] ; then
    rsync -vr --delete "$SCRIPTPATH/$SUBFOLDER_WWW" "$CONFDIR"
    if [ -d "$CONFDIR/$SUBFOLDER_WWW_INC" ] ; then
        rsync -vr "$CONFDIR/$SUBFOLDER_WWW_INC/" "$CONFDIR/$SUBFOLDER_WWW"
    fi
fi
