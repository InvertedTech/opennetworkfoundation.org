#!/usr/bin/env bash
set -euo pipefail;
# set -x;

FOUND=0;

while IFS=; read -r LINE; do {
	[[ $FOUND == 1 ]] && echo $LINE;
	[[ $(printf '%s\n' "$LINE" | cut -c1,2,3) == "..." ]] && FOUND=1;
}; done;
