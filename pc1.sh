echo 'pc1' >> /etc/hostname
echo 'pc1' >> /etc/hosts
hostname pc1
cat >> /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet static
 address 192.168.1.1
 netmask 255.255.255.0
up route add -net 192.168.0.0/16 gw 192.168.1.254 dev enp0s8
/etc/init.d/networking restart
exit
