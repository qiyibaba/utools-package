#!/bin/sh

doc=$1
json="["

for file in `ls ./$doc/$doc`
do
	echo "$file" | grep ".html" > /dev/null
	if [ $? -eq 0 ];then
		title=`echo $file | awk -F'.' '{print $1}'`
		json=$json"{\"name\":\"$title\",\"type\":\"\",\"path\":\"mysql/$title.html\",\"desc\":\"$title\"},"
	fi
done
json=${json%?}"]"
echo $json > ./$doc/$doc.json
