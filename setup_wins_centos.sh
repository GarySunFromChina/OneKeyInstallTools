yum install -y samba samba-winbind

#nmb netbios name服务   
systemctl enable smb nmb winbind

#sed -i  '/workgroup/{/wins/!s/$/ wins/}' /etc/nsswitch.conf

group=$1
namd=$2

sed -i '/workgroup/{/wins/!s/=.*/= \$group/p}' /etc/samba/smb.conf 

sed -i '/workgroup/a\        netbios name = $name' /etc/samba/smb.conf 

sed -i '/workgroup/a\        min procotol = SMB2' /etc/samba/smb.conf 

sed -i  '/^hosts:/{/wins/!s/files /files wins /}' /etc/nsswitch.conf


firewall-cmd --permanent --add-service=samba

