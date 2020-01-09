#!/bin/bash

echo -e "\e[36mLinux Local PrivEsc Checks - s1lly_r4bbit\e[0m "
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mOS INFO\e[0m "
uname -a
cat /etc/*-release
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mUSER INFO\e[0m "
cat /etc/passwd
for i in $(cat /etc/passwd 2>/dev/null| cut -d":" -f1 2>/dev/null);do id $i;done 2>/dev/null
cat /etc/shadow
sudo -l
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mSUID FILES\e[0m "
find / -perm -4000 -type f 2>/dev/null
echo ""
echo "____________________________________________________________________________"
echo ""
#echo -e "\e[36mWORLD WRITEABLE FILES\e[0m "

#find / -perm -2 -type f 2>/dev/null

#echo ""

#echo "____________________________________________________________________________"

echo ""
echo -e "\e[36mBASH HISTORY\e[0m "
cat ~/.bash_history
ls -la ~/.*_history
ls -la /root/.*_history
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mSSH FILES\e[0m "
ls -la ~/.ssh/
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mSEARCH FOR PASSWORDS\e[0m "
find / -maxdepth 10 -name *.conf -type f -exec grep -Hn password {} \; 2>/dev/null
find / -maxdepth 10 -name *.php -type f -exec grep -Hn password {} \; 2>/dev/null
find / -maxdepth 10 -name *.conf -type f -exec grep -Hn PASSWORD {} \; 2>/dev/null
find / -maxdepth 10 -name *.php -type f -exec grep -Hn PASSWORD {} \; 2>/dev/null
echo ""
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mCHECKING CRON JOB AND PERMISSIONS\e[0m "
ls -la /etc/cron*
cat /etc/crontab
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mCHECKING NETSTAT\e[0m "
netstat -ano
echo ""
echo "____________________________________________________________________________"
echo ""
echo -e "\e[36mCHECKING MAIL\e[0m "
ls -ltrah /var/mail/
cat /var/mail/*
echo ""
echo -e "\e[36mSCRIPT DONE. GOOD LUCK\e[0m "
