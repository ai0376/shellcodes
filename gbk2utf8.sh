#!/bin/bash

convert(){

tag="ISO-8859"
echo "input $1"

echo `file $1`
result=`file $1 | grep "${tag}"`

if [[ "$result" != "" ]]; then
    echo "gbk -> utf-8"
    `iconv.exe -f gbk -t utf-8 $1 > $1.tmp`
    `mv $1.tmp $1`

    echo `file $1`
    echo "convert finish"
else
    echo "can not convert!"
fi

}

convert_curdir(){
	
filelist="ls *.h *.cpp" 

for file in $filelist
do 
	#convert $file
	echo $file
done
}

if [[ "$1" != "" ]]; then
	convert $1
else
	convert_curdir
fi