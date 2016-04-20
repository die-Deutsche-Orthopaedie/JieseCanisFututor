function GeneratePW { 
	len=64
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0 短 发 大 法 好 \! \@ \# \$ \% \^ \& \* \( \) \- \_ \= \+ \\ \/ \' \" \; \: \[ \] \{ \} \, \. \?)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}

function encrypt{
	if [ -d $1 ]
	then
		cd $1
		# md5sum *.* > /tmp/md5
		find  -type f -print0 | xargs -0 md5sum > /tmp/$1.md5
		# sha1sum *.* > /tmp/sha1
		find  -type f -print0 | xargs -0 sha1sum > /tmp/$1.sha1
		# sha256sum *.* > /tmp/sha256
		find  -type f -print0 | xargs -0 sha256sum > /tmp/$1.sha256
		mv /tmp/$1.md5 $1.md5
		mv /tmp/$1.sha1 $1.sha1
		mv /tmp/$1.sha256 $1.sha256
		cd ..
		# password="233333"
		password=`GeneratePW`
		# /root/rar/rar a -htb -m0 -ma5 -rr5 -ts -hp"$password" "$folder.rar" $folder
		currentdate=`date +%y.%m.%d`
		/root/rar/rar a -df -v2.33g -v1g -htb -m0 -ma5 -rr5 -ts -hp"$password" "$folder.$currentdate.rar" $folder
		echo "$folder♂$currentdate♂$password" >> pair.txt
	fi
}

if [ -z $1 ]
then
	echo "" > pair.txt
	for folder in `ls`
	do
		encrypt $folder
	done
else
	encrypt $folder
fi
