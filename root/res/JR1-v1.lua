------------------------------------------------------------
--MSD设备场景初始化
function user_get_scene(flag,devname)
    scene_clean_all(flag);
    scene_ico_url(flag, "http://www.hanzhihong.cn/images");
    scene_add(flag, "开机", "sm1.png","打开演示场景");
    scene_add(flag, "关机", "sm2.png","关闭所有电源");  
    print(flag , utf8_gb2312(" 初始化场景"));
end
------------------------------------------------------------
--获取MSD设备的状态
function user_get_state(flag,dev)
 print(utf8_gb2312("JR1 获取场景状态"));
end
------------------------------------------------------------
--MSD设备的数据
function from_msd_data(flag,dev,buf,len) 
    str=byte_string(buf,len);
    print("from_msd_data=",str);
   
    if is_hxnet(buf,len) then
        print(utf8_gb2312("JR1的hxnet数据帧"));
        msd_state(flag,dev,"{\"state\":[1,1]}");
    end    
end
------------------------------------------------------------
--MSD设备处理的场景
function msd_use_scene(flag,dev,scene_name)
    if scene_name=="开机" then 
        print(utf8_gb2312("发送JR1开"));
        msd_send_string_byte(flag,dev,"0xAA_0x4A_0x52_0x31_0x00_0x03_0x06_0x05_0x00_0xBA");
    elseif scene_name=="关机" then
        print(utf8_gb2312("发送JR1关"));
        msd_send_string_byte(flag,dev,"0xAA_0x4A_0x52_0x31_0x00_0x03_0x06_0x05_0xFF_0xBA");
    end;
end

