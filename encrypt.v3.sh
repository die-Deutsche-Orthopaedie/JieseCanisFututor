function GeneratePW { 
	len=64
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0 短 发 大 法 好 \! \@ \# \$ \% \^ \& \* \( \) \- \_ \= \+ \\ \/ \' \; \: \[ \] \{ \} \, \. \?)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}

RARpath="/home/WinRAR/rar"

# $1 may contains space
function encrypt {
	folder=`echo $1 | sed 's/™/ /g'`
	if [ -d "$folder" ]
	then
		cd "$folder"
		# md5sum *.* > /tmp/md5
		echo "Calculatin' MD5sum, please wait... "
		find  -type f -print0 | xargs -0 md5sum > "/tmp/$folder.md5"
		# sha1sum *.* > /tmp/sha1
		echo "Calculatin' SHA1sum, please wait... "
		find  -type f -print0 | xargs -0 sha1sum > "/tmp/$folder.sha1"
		# sha256sum *.* > /tmp/sha256
		echo "Calculatin' SHA256sum, please wait... "
		find  -type f -print0 | xargs -0 sha256sum > "/tmp/$folder.sha256"
		mv "/tmp/$folder.md5" "$folder.md5"
		mv "/tmp/$folder.sha1" "$folder.sha1"
		mv "/tmp/$folder.sha256" "$folder.sha256"
		cd ..
		# password="233333"
		password=`GeneratePW`
		# /root/rar/rar a -htb -m0 -ma5 -rr5 -ts -hp"$password" "$folder.rar" $folder
		currentdate=`date +%y.%m.%d`
		"$RARpath" a -df -v1g -htb -m0 -ma5 -rr5 -ts -ol -os -hp"$password" "$folder.$currentdate.rar" "$folder"
		echo "$folder|$currentdate|$password" >> pair.txt
		echo "$folder|$currentdate|$password" > "pair.$folder.$currentdate.txt"
	fi
}

if [ -z "$1" ]
then
	for folder in `ls | sed 's/ /™/g'`
	do
		encrypt "$folder"
	done
else
	encrypt "$1"
fi
