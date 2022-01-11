#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

outbox/%.html: inbox/%.md
	pandoc -s "$<" --template ../fragments/layout.html -o "$@"

outbox/%.html: inbox/%.txt
	pandoc -s "$<" --template ../fragments/layout.html -o "$@"
