function GenerateString { 
    len=8
    str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
    for((i=1;i<=$len;i++))
    do
        arr[$i]=${str[$[$RANDOM%87]]}
    done
    echo "${arr[@]}"|tr -d " "
}

function GenerateString2 { 
    len=10
    str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
    for((i=1;i<=$len;i++))
    do
        arr[$i]=${str[$[$RANDOM%87]]}
    done
    echo "${arr[@]}"|tr -d " "
}

function GenerateString3 { 
    len=12
    str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
    for((i=1;i<=$len;i++))
    do
        arr[$i]=${str[$[$RANDOM%87]]}
    done
    echo "${arr[@]}"|tr -d " "
}

function GenerateString4 { 
    len=16
    str=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0)
    for((i=1;i<=$len;i++))
    do
        arr[$i]=${str[$[$RANDOM%87]]}
    done
    echo "${arr[@]}"|tr -d " "
}

OLD_IFS=$IFS
IFS=$'\n'

for file in `ls | grep -v "randomize.filename.v5.sh"`
do
    newname=`GenerateString`
    newname2=`GenerateString2`
    newname3=`GenerateString3`
    newname4=`GenerateString4`
    newname="$newname.$newname2.$newname3.$newname4.rar"
    # mv "$file" "$newname"
    echo "$file|$newname" >> recover.txt
    echo "mv \"$file\" \"$newname\"" >> movefile.sh
    echo "mv \"$newname\" \"$file\"" >> recover.sh
done

f=0

# verify
for line in `cat recover.txt`
do
    newname=`echo $line | cut -f2 -d\|`
    # echo $newname
    result=`grep -c "$newname" recover.txt`
    # result="fock $result"
    # echo $result
    if [ $result -ne 1 ]; then
        let f+=1
    fi
done

echo -e "\033[36m$f\033[0m Occurrence(s) of Randomized Filename Collision"

if [ $f -eq 0 ]; then
    echo -e "\033[36mPassed Randomized Filename Collision Test\033[0m"
    bash movefile.sh
else
    echo -e "\033[31mFOCKED, try again\033[0m"
    rm recover.txt movefile.sh recover.sh -f
fi

IFS=$OLD_IFS
