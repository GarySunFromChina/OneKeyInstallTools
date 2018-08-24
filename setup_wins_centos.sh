yum install -y samba samba-winbind

#nmb netbios name服务   
systemctl enable smb nmb winbind

group=$1
name=$2

if [$group==""];then
    echo "please input workgroup[default:WORKGROUP]:"
    read group
fi

if [$name==""];then
    echo "please input hostname[default:CentOS]:"
    read name
fi



sed -i '/workgroup/{s/=.*/= '$group'/}' /etc/samba/smb.conf 

sed -i '/workgroup/a\        netbios name = '$name'' /etc/samba/smb.conf 

sed -i '/netbios name/a\        min procotol = SMB2' /etc/samba/smb.conf 

sed -i  '/^hosts:/{/wins/!s/files /files wins /}' /etc/nsswitch.conf


firewall-cmd --permanent --add-service=samba

