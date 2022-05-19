#!/bin/bash

SCRIPTPATH=$(dirname "$(realpath -s "$0")")

VERSIONSFILE=jsversions.txt

PATHPREFIX=/local/lovelace-custom/

cd "$SCRIPTPATH/www/lovelace-custom"

# sorted by file name

# https://github.com/thomasloven/lovelace-fold-entity-row
REPO="thomasloven/lovelace-fold-entity-row"
FILE="fold-entity-row.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -O "https://raw.githubusercontent.com/$REPO/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" > "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-layout-card
REPO="thomasloven/lovelace-layout-card"
FILE="layout-card.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -O "https://raw.githubusercontent.com/$REPO/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/kalkih/mini-graph-card
# on raw tags, download might break
REPO="kalkih/mini-graph-card"
FILE="mini-graph-card-bundle.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/tags | jq -r 'first | .name')
curl -L -O "https://github.com/$REPO/releases/download/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/kalkih/mini-media-player
REPO="kalkih/mini-media-player"
FILE="mini-media-player-bundle.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -L -O "https://github.com/$REPO/releases/download/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/benct/lovelace-multiple-entity-row
REPO="benct/lovelace-multiple-entity-row"
FILE="multiple-entity-row.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -O "https://raw.githubusercontent.com/$REPO/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/piitaya/lovelace-mushroom
REPO="piitaya/lovelace-mushroom"
FILE="mushroom.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -L -O "https://github.com/$REPO/releases/download/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-slider-entity-row
# on raw tags
REPO="thomasloven/lovelace-slider-entity-row"
FILE="slider-entity-row.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/tags | jq -r '.[] | select(.name|test("^\\d.*";"g")) .name' | head -n 1)
curl -O "https://raw.githubusercontent.com/$REPO/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/ofekashery/vertical-stack-in-card
REPO="ofekashery/vertical-stack-in-card"
FILE="stack-in-card.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl "https://raw.githubusercontent.com/$REPO/$TAG/vertical-stack-in-card.js" 2>/dev/null | sed s/vertical-stack-in-card/stack-in-card/ > "$FILE"
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"

# https://github.com/thomasloven/lovelace-template-entity-row
REPO="thomasloven/lovelace-template-entity-row"
FILE="template-entity-row.js"
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.tag_name')
curl -O "https://raw.githubusercontent.com/$REPO/$TAG/$FILE" 2>/dev/null
echo "$PATHPREFIX$FILE?v=$TAG" >> "$SCRIPTPATH/$VERSIONSFILE"
