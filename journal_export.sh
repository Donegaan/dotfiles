#!/usr/bin/env bash

cd ~/workspace/journal

jrnl --format md --file "$OSTYPE"_journal.md
jrnl life --format md --file "$OSTYPE"_life_journal.md

git add "$OSTYPE"_journal.md
git add "$OSTYPE"_life_journal.md
git commit -m "Adding journal entries"
git push
