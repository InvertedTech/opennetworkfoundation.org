#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

docs/%.html: articles/%.md
	pandoc -s "$<" --template ./fragments/layout.html -o "$@"

docs/%.html: articles/%.txt
	pandoc -s "$<" --template ./fragments/layout.html -o "$@"
