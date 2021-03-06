RARpath="/root/rar/rar"

for pair in `cat pair.txt`
do
	folder=`echo $pair | cut -d♂ -f1`
	currentdate=`echo $pair | cut -d♂ -f2`
	password=`echo $pair | cut -d♂ -f3`
	# /root/rar/rar x -ts -p"$password" "$folder.$currentdaterar"
	if [ -f "$folder.$currentdate.rar" ]
	then
		$RARpath x -ts -p"$password" "$folder.$currentdate.rar"
	fi
	if [ -f "$folder.$currentdate.part1.rar" ]
	then
		$RARpath x -ts -p"$password" "$folder.$currentdate.part1.rar"
	fi
	if [ -f "$folder.$currentdate.part01.rar" ]
	then
		$RARpath x -ts -p"$password" "$folder.$currentdate.part01.rar"
	fi
	if [ -f "$folder.$currentdate.part001.rar" ]
	then
		$RARpath x -ts -p"$password" "$folder.$currentdate.part001.rar"
	fi
	cd $folder
	md5sum --quiet -c $folder.md5
	sha1sum --quiet -c $folder.sha1
	sha256sum --quiet -c $folder.sha256
	cd ..
done
