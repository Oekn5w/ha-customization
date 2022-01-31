#!/bin/bash

SCRIPTPATH=$(dirname "$(realpath -s "$0")")

VERSIONSFILE=jsversions.txt

PATHPREFIX=/local/lovelace-custom/

cd "$SCRIPTPATH/www/lovelace-custom"

# https://github.com/thomasloven/lovelace-fold-entity-row
FER_REPO="thomasloven/lovelace-fold-entity-row"
FER_FILE="fold-entity-row.js"
FER_TAG=$(curl -s https://api.github.com/repos/$FER_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -O "https://raw.githubusercontent.com/$FER_REPO/$FER_TAG/$FER_FILE" 2>/dev/null
echo "$PATHPREFIX$FER_FILE?v=$FER_TAG" > "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-layout-card
LC_REPO="thomasloven/lovelace-layout-card"
LC_FILE="layout-card.js"
LC_TAG=$(curl -s https://api.github.com/repos/$LC_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -O "https://raw.githubusercontent.com/$LC_REPO/$LC_TAG/$LC_FILE" 2>/dev/null
echo "$PATHPREFIX$LC_FILE?v=$LC_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/kalkih/mini-graph-card
MG_REPO="kalkih/mini-graph-card"
MG_FILE="mini-graph-card-bundle.js"
MG_TAG=$(curl -s https://api.github.com/repos/$MG_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -L -O "https://github.com/$MG_REPO/releases/download/$MG_TAG/$MG_FILE" 2>/dev/null
echo "$PATHPREFIX$MG_FILE?v=$MG_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/kalkih/mini-media-player
MP_REPO="kalkih/mini-media-player"
MP_FILE="mini-media-player-bundle.js"
MP_TAG=$(curl -s https://api.github.com/repos/$MP_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -L -O "https://github.com/$MP_REPO/releases/download/$MP_TAG/$MP_FILE" 2>/dev/null
echo "$PATHPREFIX$MP_FILE?v=$MP_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/benct/lovelace-multiple-entity-row
MER_REPO="benct/lovelace-multiple-entity-row"
MER_FILE="multiple-entity-row.js"
MER_TAG=$(curl -s https://api.github.com/repos/$MER_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -O "https://raw.githubusercontent.com/$MER_REPO/$MER_TAG/$MER_FILE" 2>/dev/null
echo "$PATHPREFIX$MER_FILE?v=$MER_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-slider-entity-row
SER_REPO="thomasloven/lovelace-slider-entity-row"
SER_FILE="slider-entity-row.js"
SER_TAG=$(curl -s https://api.github.com/repos/$SER_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -O "https://raw.githubusercontent.com/$SER_REPO/$SER_TAG/$SER_FILE" 2>/dev/null
echo "$PATHPREFIX$SER_FILE?v=$SER_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/ofekashery/vertical-stack-in-card
SIC_REPO="ofekashery/vertical-stack-in-card"
SIC_FILE="stack-in-card.js"
SIC_TAG=$(curl -s https://api.github.com/repos/$SIC_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl "https://raw.githubusercontent.com/$SIC_REPO/$SIC_TAG/vertical-stack-in-card.js" 2>/dev/null | sed s/vertical-stack-in-card/stack-in-card/ > "$SIC_FILE"
echo "$PATHPREFIX$SIC_FILE?v=$SIC_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-template-entity-row
TER_REPO="thomasloven/lovelace-template-entity-row"
TER_FILE="template-entity-row.js"
TER_TAG=$(curl -s https://api.github.com/repos/$TER_REPO/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -O "https://raw.githubusercontent.com/$TER_REPO/$TER_TAG/$TER_FILE" 2>/dev/null
echo "$PATHPREFIX$TER_FILE?v=$TER_TAG" >> "$SCRIPTPATH/$VERSIONSFILE"
