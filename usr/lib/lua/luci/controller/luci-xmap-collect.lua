
module("luci.controller.luci-xmap-collect", package.seeall)


function index()
        if not nixio.fs.access("/etc/config/luci-xmap-collect") then
                return
        end
        entry({"admin", "services", "luci-xmap-collect"}, cbi("admin_xmap/luci-xmap-collect"), _("数据转接器")).dependent = true
end
