echo "router1" >> /etc/hostname
echo "127.0.1.1 router1" >> /etc/hosts
hostname router1
apt-get update
yes | apt-get install quagga quagga-doc traceroute
cp /usr/share/doc/quagga-core/examples/zebra.conf.sample /etc/quagga/zebra.conf
cp /usr/share/doc/quagga-core/examples/ospfd.conf.sample /etc/quagga/ospfd.conf
chown quagga.quaggavty /etc/quagga/*.conf
chmod 640 /etc/quagga/*.conf
touch /etc/quagga/daemons
echo "zebra=yes" >> /etc/quagga/daemons
echo "ospfd=yes" >> /etc/quagga/daemons
echo 'VTYSH_PAGER=more' >>/etc/environment
echo 'export VTYSH_PAGER=more' >>/etc/bash.bashrc
cat >> /etc/quagga/ospfd.conf << EOF
interface enp0s8
interface enp0s9
interface enp0s10
interface lo
router ospf
 passive-interface enp0s8
 network 192.168.1.0/24 area 0.0.0.0
 network 192.168.2.0/24 area 0.0.0.0
line vty
EOF
cat >> /etc/quagga/zebra.conf << EOF
interface enp0s8
 ip address 192.168.1.254/24
 ipv6 nd suppress-ra
interface enp0s9
 ip address 192.168.2.254/24
 ipv6 nd suppress-ra
interface lo
ip forwarding
line vty
EOF
sudo systemctl restart zebra.service
sudo systemctl restart ospfd.service
exit 