function GenerateString { 
	len=32
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}

function GenerateString2 { 
	len=24
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]}
	done
	echo "${arr[@]}"|tr -d " "
}

function GenerateString3 { 
	len=32
	str=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}


for file in `ls |  grep "\.rar" | sed 's/ /™/g'`
do
	file=`echo $file | sed 's/™/ /g'`
	newname=`GenerateString`
    newname2=`GenerateString`
    newname3=`GenerateString`
	newname="$newname.$newname2.$newname3.rar"
	mv "$file" "$newname"
	echo "$file|$newname" >> recover.txt
	echo "mv \"$newname\" \"$file\"" >> recover.sh
done
