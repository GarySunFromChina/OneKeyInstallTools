yum install -y samba winbind libnss-winbind

sed -i  '/^hosts:/{/wins/!s/$/ wins/}' /etc/nsswitch.conf
