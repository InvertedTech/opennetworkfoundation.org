#!/usr/bin/env bash
set -euo pipefail;
# set -x;

while IFS=; read -r LINE; do {
	echo $LINE;
	[[ $(printf '%s\n' "$LINE" | cut -c1,2,3) == "..." ]] && break;
}; done;
