function GeneratePW { 
	len=64
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0 短 发 大 法 好 \! \@ \# \$ \% \^ \& \* \( \) \- \_ \= \+ \\ \/ \' \" \; \: \[ \] \{ \} \, \. \?)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}

echo "" > pair.txt
for folder in `ls`
do
	if [ -d $folder ]
	then
		cd $folder
		md5sum *.* > /tmp/md5
		sha1sum *.* > /tmp/sha1
		sha256sum *.* > /tmp/sha256
		mv /tmp/md5 $folder.md5
		mv /tmp/sha1 $folder.sha1
		mv /tmp/sha256 $folder.sha256
		cd ..
		# password="233333"
		password=`GeneratePW`
		# /root/rar/rar a -htb -m0 -ma5 -rr5 -ts -hp"$password" "$folder.rar" $folder
		currentdate=`date +%y.%m.%d`
		/root/rar/rar a -df -htb -m0 -ma5 -rr5 -ts -hp"$password" "$folder.$currentdate.rar" $folder
		echo "$folder♂$currentdate♂$password" >> pair.txt
	fi
done
