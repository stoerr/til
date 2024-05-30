# SQLite stuff

SQLite is a nice database for small projects; I know it especially since
[Simon Willison](https://simonwillison.net/) uses it for lots of projects like
[LLM](https://llm.datasette.io/en/stable/). Here is just some stuff I collected to deal with sqlite databases.

I installed the sqlite3 command line tool (`brew install sqlite`) and Simon Willisons
[sqlite-utils](https://github.com/simonw/sqlite-utils) (`brew install sqlite-utils`),
`jq` is for json formatting.

## Commands

- show tables: `sqlite-utils tables embeddings.db` or `sqlite-utils schema embeddings.db`
- export data as json: `sqlite3 embeddings.db '.mode json' 'select * from embeddings' | jq | less`
- or: `sqlite-utils rows embeddings.db embeddings --nl -c id -c content -c embedding | jq > embeddings.json`
