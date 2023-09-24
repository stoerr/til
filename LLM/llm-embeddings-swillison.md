# LLM Embeddings (usage of tool by Simon Willison)

[Simon Willison]() has a very comprehensive command line tool 
[llm](https://llm.datasette.io/en/stable/) for working with large language models (both ChatGPT 
and others, incl. local models). Very recommended! There are just some notes about using LLM embeddings for search 
in local files, mostly according to his [blog entry about that](https://simonwillison.net/2023/Sep/4/llm-embeddings/).

## Installation 

See [his blog](https://simonwillison.net/2023/Sep/4/llm-embeddings/). I use homebrew on Macl

    brew install llm
    llm install -U llm 
    llm install llm-sentence-transformers 
    llm sentence-transformers register all-MiniLM-L6-v2
    llm aliases set minilm sentence-transformers/all-MiniLM-L6-v2
    llm keys set openai

## Calculate embeddings

Just print embedding for something: `llm embed -m ada-002 -c "something"` (OpenAI) <br/>
`llm embed -m sentence-transformers/all-MiniLM-L6-v2 -c "Hello World"`

## Collections

Just omit the -d test.db if you like to use your llm database stored in your
`~/Library/Application Support/io.datasette.llm/embeddings.db` .

#### Explicitly storing phrases in local collection

    llm embed -d test.db -m minilm test hello -c "hello world"
    llm embed -d test.db test helloagain -c "hello again"
    llm similar -d test.db test -c "hello"

### Store documents

    llm embed-multi til -d til.db -m minilm --store --files . '**/*.md'
    llm similar til -d til.db -n 5 -c "how to sync content from JCR to AEM"

Argument --store for embed-multi stores the content, but that makes the output of `llm similar` very hard to read.
