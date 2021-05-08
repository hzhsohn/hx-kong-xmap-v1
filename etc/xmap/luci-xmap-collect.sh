#!/bin/sh

echo luci for luci-xmap-collect
local vt_enabled=`uci get luci-xmap-collect.@collect-service[0].enabled 2>/dev/null`
echo "vt_enabled=" $vt_enabled
if [ "$vt_enabled" = 1 ]; then
logger -t alex restarting xmap-collect
 echo "restarting xmap"
/etc/init.d/xmap-collect enable
/etc/init.d/xmap-collect restart
else
logger -t alex stopping xmap
echo "stopping xmap-collect"
/etc/init.d/xmap-collect disable
/etc/init.d/xmap-collect stop
fi
