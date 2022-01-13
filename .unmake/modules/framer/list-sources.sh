#!/usr/bin/env bash
set -euo pipefail;

touch -d0 index/top-bar.json .unmake/modules/framer/templates/top-bar.tmp.html index/menu.json .unmake/modules/framer/templates/menu.tmp.html
find index/top-bar.json .unmake/modules/framer/templates/top-bar.tmp.html index/menu.json .unmake/modules/framer/templates/menu.tmp.html
