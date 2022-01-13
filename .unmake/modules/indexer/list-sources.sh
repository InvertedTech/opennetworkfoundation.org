#!/usr/bin/env bash
set -euo pipefail;

[[ -n "${1-}" ]] && {
	find articles/ -name '*.md' -o -name '*.txt' -o -name '*.url' -o -name '*.html' | while read SOURCE; do {

		BASENAME=`basename $1`;

		bin/yaq.pl $SOURCE <<< 'index # name' | while read INDEX; do {

			[[ "$INDEX" != "${BASENAME%.*}" ]] && {
				continue;
			};

			echo $SOURCE;
			break;


		}; done;
	}; done;
};

[[ -z "${1-}" ]] && {
	find articles/ -name '*.md' -o -name '*.txt' -o -name '*.url' -o -name '*.html';
};
