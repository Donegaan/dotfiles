#!/usr/bin/env bash

cd ~/workspace/journal

mkdir -p work life

jrnl --format md --file work/"$OSTYPE"_journal.md
jrnl life --format md --file life/"$OSTYPE"_life_journal.md

git add work/"$OSTYPE"_journal.md
git add life/"$OSTYPE"_life_journal.md
git commit -m "Adding journal entries"
git push
