local fs = require "nixio.fs"


m=Map("luci-xmap-collect",translate("中控管理"),translate("XMap-Collect 中控数据转接器, 参考文档 <a href=http://xmap.hx-kong.com/doc target=_blank>http://xmap.hx-kong.com/doc</a>"))
s=m:section(TypedSection,"collect-service","")
s.addremove=false
s.anonymous=true

  --系统服务是否启用
	xmap_enable = s:option(Flag,"enabled","Collect服务  " .. translate("Enable"))

  -- XML配置
	caid_cfg = s:option(TextValue, "1", "xmap-collect配置<br/>(XML格式) ")
	caid_cfg.rmempty = true
	caid_cfg.rows = 25
	
	function caid_cfg.cfgvalue()
		return nixio.fs.readfile("/etc/xmap/xmap-collect.config") or ""
	end
	function caid_cfg.write(self, section, value)
      nixio.fs.writefile("/etc/xmap/xmap-collect.config", value)
	end
		
return m