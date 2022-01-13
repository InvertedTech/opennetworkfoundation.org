#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

INDEX_LAYOUT=./templates/layout.tmp.html
ARTICLE_LAYOUT=./fragments/article-layout.frag.html
# ./fragments/layout.html

docs/%.html: articles/%.md ${ARTICLE_LAYOUT} ./fragments/*
	pandoc -s "$<" --template ${ARTICLE_LAYOUT} -o "$@"
	echo "<!--" `date` "-->" >> "$@"

docs/%.html: articles/%.txt ${ARTICLE_LAYOUT} ./fragments/*
	pandoc -s "$<" --template ${ARTICLE_LAYOUT} -o "$@"
	echo "<!--" `date` "-->" >> "$@"

docs/%.html: articles/%.html ${INDEX_LAYOUT} ./fragments/*
	perl .unmake/modules/framer/bin/assemble.pl ${INDEX_LAYOUT} $< > $@
	pandoc -s < <( bin/sheer.sh < $< ) --template "$@" -o "$@"
	echo "<!--" `date` "-->" >> "$@"

