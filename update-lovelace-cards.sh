#!/bin/bash

SCRIPTPATH=$(dirname "$(realpath -s "$0")")

cd "$SCRIPTPATH/www/lovelace-custom"

# https://github.com/thomasloven/lovelace-fold-entity-row
curl -O "https://raw.githubusercontent.com/thomasloven/lovelace-fold-entity-row/master/fold-entity-row.js" 2>/dev/null

# https://github.com/thomasloven/lovelace-layout-card
curl -O "https://raw.githubusercontent.com/thomasloven/lovelace-layout-card/master/layout-card.js" 2>/dev/null

# https://github.com/kalkih/mini-media-player
MINI_PLAYER_TAG=$(curl -s https://api.github.com/repos/kalkih/mini-media-player/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -L -O "https://github.com/kalkih/mini-media-player/releases/download/$MINI_PLAYER_TAG/mini-media-player-bundle.js" 2>/dev/null

# https://github.com/thomasloven/lovelace-slider-entity-row
curl -O "https://raw.githubusercontent.com/thomasloven/lovelace-slider-entity-row/master/slider-entity-row.js" 2>/dev/null

# https://github.com/ofekashery/vertical-stack-in-card
curl -o "stack-in-card.js" "https://raw.githubusercontent.com/ofekashery/vertical-stack-in-card/master/vertical-stack-in-card.js" 2>/dev/null

# https://github.com/thomasloven/lovelace-template-entity-row
curl -O "https://raw.githubusercontent.com/thomasloven/lovelace-template-entity-row/master/template-entity-row.js" 2>/dev/null
