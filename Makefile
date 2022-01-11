#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail
MAKEFLAGS += --no-builtin-rules --warn-undefined-variables --no-print-directory

all: targets

include .unmake/unmake/Makefile

$(call IMPORT_MODULE,publisher)

targets: unmake-index ${UNMAKE_TARGETS}

