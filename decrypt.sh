for pair in `cat pair.txt`
do
	folder=`echo $pair | cut -d♂ -f1`
	currentdate=`echo $pair | cut -d♂ -f2`
	password=`echo $pair | cut -d♂ -f3`
	# /root/rar/rar x -ts -p"$password" "$folder.$currentdaterar"
	/root/rar/rar x -df -ts -p"$password" "$folder.$currentdate.rar"
	cd $folder
	md5sum --quiet -c $folder.md5
	sha1sum --quiet -c $folder.sha1
	sha256sum --quiet -c $folder.sha256
	cd ..
done
