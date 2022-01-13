#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

.unmake/modules/framer/fragments/top-bar.frag.html: .unmake/modules/framer/templates/top-bar.tmp.html index/top-bar.json
	perl .unmake/modules/framer/bin/interpolate.pl $^ > $@

.unmake/modules/framer/fragments/menu.frag.html: .unmake/modules/framer/templates/menu.tmp.html index/menu.json
	perl .unmake/modules/framer/bin/interpolate.pl $^ > $@

.unmake/modules/framer/fragments/article-layout.frag.html: index/menu.json .unmake/modules/framer/fragments/*
	perl .unmake/modules/framer/bin/assemble.pl .unmake/modules/framer/templates/article-layout.tmp.html > $@

.unmake/modules/framer/fragments/layout.frag.html: index/top-bar.json .unmake/modules/framer/fragments/*
	perl .unmake/modules/framer/bin/assemble.pl .unmake/modules/framer/templates/layout.tmp.html > $@
