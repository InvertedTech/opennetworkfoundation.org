#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

./fragments/top-bar.frag.html: templates/top-bar.tmp.html index/top-bar.json
	perl .unmake/modules/framer/bin/interpolate.pl $^ > $@

./fragments/menu.frag.html: templates/menu.tmp.html index/menu.json
	perl .unmake/modules/framer/bin/interpolate.pl $^ > $@

./fragments/article-layout.frag.html: index/menu.json ./fragments/*
	perl .unmake/modules/framer/bin/assemble.pl templates/article-layout.tmp.html > $@

./fragments/layout.frag.html: index/top-bar.json ./fragments/*
	perl .unmake/modules/framer/bin/assemble.pl templates/layout.tmp.html > $@
