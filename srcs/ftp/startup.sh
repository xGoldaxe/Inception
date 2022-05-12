#!/bin/sh
mkdir -p /var/www

mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_PASS /var/www

echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
