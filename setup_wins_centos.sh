yum install -y samba samba-winbind

systemctl enable smb winbind

#sed -i  '/workgroup/{/wins/!s/$/ wins/}' /etc/nsswitch.conf

sed -i  '/^hosts:/{/wins/!s/$/ wins/}' /etc/nsswitch.conf


firewall-cmd --permanent --add-service=samba

