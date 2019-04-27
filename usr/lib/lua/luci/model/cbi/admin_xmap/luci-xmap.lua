local fs = require "nixio.fs"


m=Map("luci-xmap",translate("中控管理"),translate("XMap 物联网中控系统, 韩讯联控 <a href=http://www.hx-kong.com target=hx-kong>http://www.hx-kong.com</a>"))
s=m:section(TypedSection,"dtrs","")
s.addremove=false
s.anonymous=true

  --中控系统是否启用
	xmap_enable = s:option(Flag,"enabled","XMap服务  " .. translate("Enable"))

  -- caid配置
	caid_cfg = s:option(Value, "1", "CAID区域码<br/>(清空输入空格保存) ")
	caid_cfg.rmempty = true
	caid_cfg.rows = 1
	
	function caid_cfg.cfgvalue()
		return nixio.fs.readfile("/root/secr/caid") or ""
	end
	function caid_cfg.write(self, section, value)
      value=value:gsub(" ", "")
      value=value:gsub("\r\n?", "\n")
      nixio.fs.writefile("/root/secr/caid", value)
	end
		
return m