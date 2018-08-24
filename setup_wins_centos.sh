yum install -y samba samba-winbind

#nmb netbios name服务   
systemctl enable smb nmb winbind

#sed -i  '/workgroup/{/wins/!s/$/ wins/}' /etc/nsswitch.conf

sed -i  '/^hosts:/{/wins/!s/$/ wins/}' /etc/nsswitch.conf


firewall-cmd --permanent --add-service=samba

