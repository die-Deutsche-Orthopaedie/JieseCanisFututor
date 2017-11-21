function GeneratePW { 
	len=64
	str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0 短 发 大 法 好 \! \@ \# \$ \% \^ \& \* \( \) \- \_ \= \+ \\ \/ \' \; \: \[ \] \{ \} \, \. \?)
	for((i=1;i<=$len;i++))
	do
		arr[$i]=${str[$[$RANDOM%87]]}
	done
	echo "${arr[@]}"|tr -d " "
}

RARpath="rar"

# $1 may contains space
function encrypt {
	file=`echo $1 | sed 's/™/ /g'`
	password=`GeneratePW`
	currentdate=`date +%y.%m.%d`
	"$RARpath" a -df -v1g -htb -m0 -ma5 -rr5 -ts -ol -hp"$password" "$file.$currentdate.rar" "$file"
	echo "$file|$currentdate|$password" >> pair.txt
	echo "$file|$currentdate|$password" > "pair.$file.$currentdate.txt"
}

if [ -z "$1" ]
then
	for file in `ls | sed 's/ /™/g'`
	do
		encrypt "$file"
	done
else
	encrypt "$1"
fi
