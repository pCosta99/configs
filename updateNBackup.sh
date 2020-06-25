#!/bin/bash

# Check if the amount of bytes changed in total
declare -i totalLines=0
declare -i currentLineDiff=0

echo -e "Comparing files...\n"

#.vimrc
currentLineDiff=$(diff .vimrc ~/.vimrc | grep "^>" | wc -l)
totalLines=totalLines+currentLineDiff
echo ".vimrc has $currentLineDiff new lines."

#.zshrc
currentLineDiff=$(diff .zshrc ~/.zshrc | grep "^>" | wc -l)
totalLines=totalLines+currentLineDiff
echo ".zshrc has $currentLineDiff new lines."

#i3
currentLineDiff=$(diff -qrN i3 ~/.config/i3 | wc -l)
totalLines=totalLines+currentLineDiff
echo "i3 has $currentLineDiff different files."

#polybar
currentLineDiff=$(diff -qrN polybar ~/.config/polybar | wc -l)
totalLines=totalLines+currentLineDiff
echo "polybar has $currentLineDiff different files."

#termite
currentLineDiff=$(diff -qrN termite ~/.config/termite | wc -l)
totalLines=totalLines+currentLineDiff
echo -e "termite has $currentLineDiff different files.\n"

# back up the current configs on the repository to a backup folder with today's date and hour if something changed
if [ $totalLines != 0 ]; then
    echo "Backing up files..."
    date=$(date +%d.%m.%y-%H:%M:%S)
    mkdir -p backups/$date
    cp -r i3 backups/$date/
    cp -r polybar backups/$date/
    cp -r termite backups/$date/
    cp .vimrc backups/$date/
    cp .zshrc backups/$date/
    echo -e "Backup done!\n"

    # load new configs
    echo -e "Loading new configs into current directory...\n"
    cp -r ~/.config/i3 .
    cp -r ~/.config/polybar .
    cp -r ~/.config/termite .
    cp ~/.vimrc .
    cp ~/.zshrc .
    echo -e "Done!\n"
else
    echo "No files were changed, no need to backup!"
fi


