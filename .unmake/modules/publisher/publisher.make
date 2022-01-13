#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

INDEX_LAYOUT=.unmake/modules/framer/templates/layout.tmp.html
ARTICLE_LAYOUT=.unmake/modules/framer/fragments/article-layout.frag.html
# ./fragments/layout.html

docs/%.html: articles/%.md ${ARTICLE_LAYOUT} .unmake/modules/framer/fragments/*
	pandoc -s "$<" --template ${ARTICLE_LAYOUT} -o "$@"

docs/%.html: articles/%.txt ${ARTICLE_LAYOUT} .unmake/modules/framer/fragments/*
	pandoc -s "$<" --template ${ARTICLE_LAYOUT} -o "$@"

docs/%.html: articles/%.html ${INDEX_LAYOUT} .unmake/modules/framer/fragments/*
	perl .unmake/modules/framer/bin/assemble.pl ${INDEX_LAYOUT} $< > $@
	pandoc -s < <( bin/sheer.sh < $< ) --template "$@" -o "$@"

