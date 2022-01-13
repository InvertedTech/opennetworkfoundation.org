#!/usr/bin/env bash
set -euo pipefail;

touch -d0 index/top-bar.json templates/top-bar.tmp.html index/menu.json templates/menu.tmp.html
find index/top-bar.json templates/top-bar.tmp.html index/menu.json templates/menu.tmp.html
