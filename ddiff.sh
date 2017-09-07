#!/bin/bash

# Demetrio Diff Tool
# Diff cur-branch and $1 branch
# args: a/origin/branch

clear;
printf "\nDemetrio DIFF TOOL\n\n";

if [ -z "$1" ]
  then
  	printf "ERROR \nDDIFF Tool needs a diffing Branch! \nAborting.\n\n"
    exit
fi

CUR_BRANCH=`git rev-parse --abbrev-ref HEAD`;
DIFF_OUTPUT="`git diff $1 --name-only`";

printf "Current Branch: $CUR_BRANCH\n";
printf "Diffing Branch: $1\n\n";

mkdir -p "./diff";

while read -r line; do
	FILENAME=`echo $line.diff | sed 's/\//-/g'`
	echo "--> /diff/$FILENAME";
	echo "`git diff origin/development -- $line`" > "diff/$FILENAME";
done <<< "$DIFF_OUTPUT"

printf "\nDone. \nCheck it out diff files in: $PWD/diff/ \n\n";

