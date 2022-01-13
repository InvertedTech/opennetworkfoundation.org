#!/usr/bin/env bash
set -euo pipefail;
# set -x;

while read -r FILENAME; do

	BASENAME=`basename "${FILENAME}"`;

	echo  "docs/${BASENAME%.*}.html";
done
