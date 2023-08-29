config
set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 description 'TO HOST'

set interfaces ethernet eth1 address 192.168.1.254/24
set interfaces ethernet eth1 description 'TO PC1'
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 default-router 192.168.1.254
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 lease 86400
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 range 0 start 192.168.1.9
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 range 0 stop 192.168.1.254
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 domain-name 'intnet-1'
set service dhcp-server shared-network-name intnet-1 subnet 192.168.1.0/24 dns-server 9.9.9.9

set interfaces ethernet eth2 address 192.168.2.254/24
set interfaces ethernet eth2 description 'TO PC2'
set service dhcp-server shared-network-name intnet-2 subnet 192.168.2.0/24 default-router 192.168.2.254
set service dhcp-server shared-network-name intnet-2 subnet 192.168.2.0/24 lease 86400
set service dhcp-server shared-network-name intnet-2 subnet 192.168.2.0/24 range 0 start 192.168.2.9
set service dhcp-server shared-network-name intnet-2 subnet 192.168.2.0/24 range 0 stop 192.168.2.254
set service dhcp-server shared-network-name intnet-1 subnet 192.168.2.0/24 domain-name 'intnet-2'
set service dhcp-server shared-network-name intnet-1 subnet 192.168.2.0/24 dns-server 9.9.9.9

commit
save