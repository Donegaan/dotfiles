#!/usr/bin/env bash

cd ~/workspace/journal

mkdir -p work life

/home/linuxbrew/.linuxbrew/bin/jrnl -from "this year" --format md --file work/work_journal_"$(date +%Y)".md
/home/linuxbrew/.linuxbrew/bin/jrnl todo --format md --file work/todo.md
/home/linuxbrew/.linuxbrew/bin/jrnl life --format md --file life/"$OSTYPE"_life_journal.md

git pull
git add .
git commit -m "Adding journal entries"
git push

cd ~/workspace/notes || exit

git pull
git add "*.md"
git commit -m "Adding only markdown notes"
git push

cd ~/workspace/personal_notes/ || exit

git pull
git add "*.md"
git commit -m "Adding only markdown notes"
git push
