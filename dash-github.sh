#!/bin/bash
GETBACK=$(pwd)

package=$(basename $1)
author=$(basename $(dirname $1))

cd $HOME/Documents/Github
git clone git@github.com:$(echo $author)/$(echo $package).git
shopt -s nocaseglob # makes case insensitive for mv below
mv $(echo $package)/README.* $(echo $package).md
echo "https://github.com/$author/$package"|cat - $(echo $package).md > /tmp/out && mv /tmp/out $(echo $package).md
grip $(echo $package).md --export $(echo $package).html
rm -rf $package
dashing build mydocs
open dashing.docset -a Dash
cd $GETBACK

