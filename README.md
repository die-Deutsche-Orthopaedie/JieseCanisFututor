# JieseCanisFututor
encryption and decryption of large amount of files via RAR so that they can be transmitted via hi-speed and insecure and Jiese Canes filled inland file storage services, like Xunlei Lixian or what. definitely best wish of Jiese Canes with dick rot in hell.


用RAR实现的大量文件加密和解密，加密后的文件就可以在高速、不安全而且充满戒色狗的国内文件存储服务（比如迅雷离线或者什么）上面传输了。当然举报者最好烂掉激霸。


encrypt.sh: simply put it under a directory with lot of sub-directories and execute it, it will automatically calculate MD5, SHA1 and SHA256 of every files inside sub-directories and store individially, archive every single sub-directory into a .rar file with random 64-bit password, delete source files, and store filename-password infomations into pair.txt. 

encrypt.sh：只需放在有大量子目录的目录下执行，它将自动计算子目录下所有文件的MD5、SHA1和SHA256并分别存放，将每一个子目录用64位的随机密码加密打包成一个.rar文件，删除源文件，并将文件名和密码信息存储到pair.txt里。


pair.txt is CRUCIAL that it's the ONLY thing that can decrypt  files, if lost you're gonna NOT recovery encrypted files ANYMORE. so store it with extreme caution and have as many backups as possible. 

pair.txt至关重要，只有它才能解密那些文件，如果你丢了这个文件你那些加了密的压缩包就成了一堆废物。所以小心存储pair.txt，做尽可能多的备份。


decrypt.sh: simply put it under a directory with .rar files AND pair.txt and execute it, it will automatically read file infomations from pair.txt and extract original directories from .rar files written in pair.txt with the password in pair.txt, and verify MD5, SHA1 and SHA256 inside every single sub-directory after extraction. 

decrypt.sh：只需放在有pair.txt和对应的.rar文件的目录下执行，它将自动读取pair.txt里的文件信息，并用pair.txt里的密码来解压pair.txt里记载的.rar文件，从中解压出原来的目录，并在解压后验证每一个子目录内的MD5、SHA1和SHA256。


(16.07.13 update)compatible with cygwin, now you can use the script on Windows. don't forget to copy a WinRAR into cygwin folder. 

（16.07.13更新）兼容cygwin，现在你可以在Windows上面使用这个脚本了。别忘了往cygwin里面拷一份WinRAR。


UPDATE: corrected a word. and as long as i stay in that fuckin' stupid putian hospital SEO company, my English will be declined rapidly. now i can't even fuckin' spell "calculate" correctly:joy::joy_cat::joy::joy_cat::joy:

更新：更正了个单词。还有只要我在这家傻逼莆田医院SEO公司里待下去，我的英语水平将直线下降。现在好了，我™连calculate都拼不对了:joy::joy_cat::joy::joy_cat::joy:
