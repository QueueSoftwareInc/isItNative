#!/bin/bash

file="$1"

if [$file -eq ""] || [[ $file != *.ipa ]] ; then
echo "Please pass in an ipa file" 
exit 2
fi


HTML=0
JS=0
CSS=0
EXE=0


mkdir "testScratch"
cp "$file" "testScratch/testScratch.zip"
cd "testScratch"
unzip "testScratch.zip" >/dev/null

#find . -name '*.png' -exec  fun   \;

#Check for HTML Files
for i in $(find . -name '*.html');
    do HTML=$((HTML+1));
done;

#Check for JS Files
for i in $(find . -name '*.js');
    do JS=$((JS+1));
done;

#Check for CSS Files
for i in $(find . -name '*.css');
    do CSS=$((CSS+1));
done;

#Check for EXE Files
for i in $(find . -name '*.exe');
do EXE=$((EXE+1));
done;

if [ $HTML -eq 0 ] &&  [ $JS -eq 0 ] && [ $CSS -eq 0 ] && [ $EXE -eq 0 ] ; then
    echo "native"
else
    echo "not Native"
fi

cd ..

rm -rf "testScratch"

