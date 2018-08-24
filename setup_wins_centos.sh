yum install -y samba samba-winbind

#nmb netbios name服务   
systemctl enable smb nmb winbind

#sed -i  '/workgroup/{/wins/!s/$/ wins/}' /etc/nsswitch.conf

sed -i '/workgroup/{/wins/!s/=.*/= $0/p}' /etc/samba/smb.conf 

sed -i '/workgroup/netbios name = $1' /etc/samba/smb.conf 

sed -i '/workgroup/min procotol = SMB2' /etc/samba/smb.conf 

sed -i  '/^hosts:/{/wins/!s/$/ wins/}' /etc/nsswitch.conf


firewall-cmd --permanent --add-service=samba

