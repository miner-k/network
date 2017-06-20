#!/bin/bash 

tar -xvf nali-0.2.tar.gz
cd nali-0.2

./configure 
make && make install

if [ $? -ne 0 ];then 
	echo "can't install nali"
	exit 2
fi

rpm -qa | grep mtr

if [ $? -ne 0 ];then
	yum -y install mtr
	if [ $? -ne 0 ];then
		echo "can't install mtr"
		exit 3
	fi
fi

################################
#nali  IP
#nali-update   Update the IP database
#
#nali-dig      www.baidu.com
#nali-nslookup
#
#nali-traceroute
#nali-tracepath
#
#mtr www.baidu.com | nali
#

clear
cat <<-EOF
####################################

examples:
	#mtr -r 203.160.89.69 | nali
	#mtr 203.160.89.69 | nali
####################################
EOF

