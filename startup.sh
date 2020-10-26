#!/bin/sh

# echo 'test'

groupadd -g $GGID $GGROUP
useradd -u $GUID -s $GSHELL -c $GUSERNAME -g $GGID -M -d $GHOME $GUSERNAME
usermod -a -G sudo $GUSERNAME


# mkdir -p $GHOME
# chown $GUSERNAME:$GUSERNAME $GHOME


# # mkdir -p $GHOME/.config/GNS3/2.2	$GHOME/GNS3/projects	$GHOME/GNS3/images	$GHOME/app/
# # cp -r /src/app/GNS3/configs/.	$GHOME/.config/GNS3/2.2/
# # cp -r /src/app/GNS3/images/.	$GHOME/GNS3/images/
# # cp -r /src/app/GNS3/projects/.	$GHOME/GNS3/projects/
# # cp -r /src/app/gns3-py	$GHOME/app/


# echo $GUSERNAME

chmod 0666 /dev/net/tun
# chmod +s /usr/local/bin/iouyap
tunctl -u $GUSERNAME
# ifconfig tap0 $GTAPIP netmask $GTAPMASK up

# if [ "$GTAPNATENABLE" = "1" ]
# then
#     echo "--- Enabling NAT on incoming ip on tap0 device"
#     iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#     iptables -A FORWARD -i tap0 -j ACCEPT
#     iptables -A INPUT -i tap0 -j ACCEPT
# fi

# if [ "$GROUTE2GNS3" = "1" ]
# then
#     route add -net $GNS3NETWORK netmask $GNS3NETMASK gw $GTAPIP
# fi

# echo $GUSERNAME
# #gns3server

# chown -R $GUSERNAME:$GUSERNAME $GHOME
# su $GUSERNAME

nohup gns3server &

pip3 install -r /src/app/gns3-py/requirements.txt

nohup python3 /src/app/gns3-py/OpenMyProject.py &

ifconfig tap0 $GTAPIP netmask $GTAPMASK up
ip route add 10.200.33.0/24 via 10.200.1.9
ip route add 10.200.44.0/24 via 10.200.1.9

sed -i "/Ciphers/s/^#//g" /etc/ssh/ssh_config

while true;
do
	sleep 2
done;
