#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

outbox/%.html: inbox/%.md
	pandoc "$<" -o "$@"

outbox/%.html: inbox/%.txt
	pandoc "$<" -o "$@"
