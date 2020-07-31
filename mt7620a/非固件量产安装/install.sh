#上传
sshpass -p admin scp xmap_1_mipsel_24kc.ipk root@192.168.1.1:
sshpass -p admin scp libstdcpp_4.8-linaro-1_ramips.ipk root@192.168.1.1:
sshpass -p admin scp mosquitto-nossl_1.6.10-1_mipsel_24kc.ipk root@192.168.1.1:
sshpass -p admin scp librt_1.1.24-2_mipsel_24kc.ipk root@192.168.1.1:

#安装
sshpass -p admin ssh root@192.168.1.1
opkg install libstdcpp_4.8-linaro-1_ramips.ipk
opkg install librt_1.1.24-2_mipsel_24kc.ipk
opkg install mosquitto-nossl_1.6.10-1_mipsel_24kc.ipk
opkg install xmap_1_mipsel_24kc.ipk

#移除系统备份功能
sshpass -p admin scp root@192.168.1.1:/usr/lib/lua/luci/controller/cbi/admin