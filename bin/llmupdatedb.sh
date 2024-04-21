#!/usr/bin/env bash
echo update database for llmsearch.sh
echo large language model based search
progfile=$0
if test -L "$progfile"; then
  progfile=$(readlink "$progfile")
fi
progdir=$(dirname "$progfile")/..
cd $progdir

# STORE="--store"
STORE=""
#MODEL="minilm"
MODEL="3-large"

llm embed-multi til -d db/llmsearch.db -m $MODEL $STORE --files . '**/*.md'
llm embed-multi til -d db/llmsearch.db -m $MODEL $STORE --files . '**/src/**/*.java'
llm embed-multi til -d db/llmsearch.db -m $MODEL $STORE --files . '**/src/**/*.js'
llm embed-multi til -d db/llmsearch.db -m $MODEL $STORE --files . '**/src/**/*.html'
