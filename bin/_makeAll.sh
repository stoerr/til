#!/usr/bin/env bash
bin/generate_sitemap.sh
bin/llmupdatedb.sh
sqlite-utils rows db/llmsearch.db -c id -c embedding -c content -o id --json-cols embeddings | jq 'sort_by(.id)' > db/embeddings.json
