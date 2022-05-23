#!/usr/bin/env bash

cd ~/workspace/journal

mkdir -p work life

/home/linuxbrew/.linuxbrew/bin/jrnl --format md --file work/"$OSTYPE"_journal.md
/home/linuxbrew/.linuxbrew/bin/jrnl life --format md --file life/"$OSTYPE"_life_journal.md

git pull
git add work/"$OSTYPE"_journal.md
git add life/"$OSTYPE"_life_journal.md
git commit -m "Adding journal entries"
git push
