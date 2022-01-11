#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

docs/%.html: articles/%.md fragments/layout.html
	pandoc -s "$<" --template ./fragments/layout.html -o "$@"

docs/%.html: articles/%.txt fragments/layout.html
	pandoc -s "$<" --template ./fragments/layout.html -o "$@"
