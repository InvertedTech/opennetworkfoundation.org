#!/usr/bin/env make
SHELL=/usr/bin/env bash -euxo pipefail
MAKEFLAGS += --no-builtin-rules --warn-undefined-variables --no-print-directory

all: targets

include .unmake/unmake/Makefile

$(call IMPORT_MODULE,indexer)
$(call IMPORT_MODULE,framer)
$(call IMPORT_MODULE,publisher)

$(info ${UNMAKE_TARGETS});

targets: unmake-index ${UNMAKE_TARGETS}
