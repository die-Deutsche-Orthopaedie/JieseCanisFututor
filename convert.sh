cat recover.sh | sed "s/mv /ren /g" > extract.utf8.bat
echo "copy \"C:\Program Files\WinRAR\rar.exe\"" >> extract.utf8.bat
echo "if not exist copy \"C:\Program Files (x86)\WinRAR\rar.exe\"" >> extract.utf8.bat
for pair in `cat pair.txt | sed 's/ /™/g'`
do
	folder=`echo $pair | cut -d\| -f1  | sed 's/™/ /g'`
	currentdate=`echo $pair | cut -d\| -f2  | sed 's/™/ /g'`
	password=`echo $pair | cut -d\| -f3  | sed 's/™/ /g'`
	echo "if exist \"$folder.$currentdate.rar\" rar x -ts -p\"$password\" \"$folder.$currentdate.rar\"" >> extract.utf8.bat
	echo "if exist \"$folder.$currentdate.part1.rar\" rar x -ts -p\"$password\" \"$folder.$currentdate.part1.rar\"" >> extract.utf8.bat
	echo "if exist \"$folder.$currentdate.part01.rar\" rar x -ts -p\"$password\" \"$folder.$currentdate.part01.rar\"" >> extract.utf8.bat
	# echo "rar x -ts -p\"$password\" \"$folder.$currentdate.part01.rar\"" >> extract.utf8.bat
	echo "if exist \"$folder.$currentdate.part001.rar\" rar x -ts -p\"$password\" \"$folder.$currentdate.part001.rar\"" >> extract.utf8.bat
	echo "if exist \"$folder.$currentdate.part0001.rar\" rar x -ts -p\"$password\" \"$folder.$currentdate.part0001.rar\"" >> extract.utf8.bat
	# echo "del \"$folder.$currentdate.\"*rar" >> extract.utf8.bat
done
unix2dos extract.utf8.bat
iconv -f UTF-8 -t GBK extract.utf8.bat > extract.bat
