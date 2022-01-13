#!/usr/bin/env make
SHELL=/usr/bin/env bash -euo pipefail

index/top-bar.json: $(shell .unmake/modules/indexer/list-sources.sh index/top-bar.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/menu.json: $(shell .unmake/modules/indexer/list-sources.sh index/menu.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/games.json: $(shell .unmake/modules/indexer/list-sources.sh index/games.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/footer.json: $(shell .unmake/modules/indexer/list-sources.sh index/footer.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/foo.json: $(shell .unmake/modules/indexer/list-sources.sh index/foo.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/bar.json: $(shell .unmake/modules/indexer/list-sources.sh index/bar.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);

index/baz.json: $(shell .unmake/modules/indexer/list-sources.sh index/baz.json)
	jq -nR '[{article: inputs | select(length>0)}]' > "$@" < <(find $^);
