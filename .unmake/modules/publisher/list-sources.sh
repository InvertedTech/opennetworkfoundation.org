#!/usr/bin/env bash
set -euo pipefail;

find ./articles/ -type f\
	-name '*.md'\
	-o -name '*.txt'\
	-o -name '*.html'\
	| grep -v '\/\.'
