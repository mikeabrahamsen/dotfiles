local awful = require("awful")
local vicious = require("vicious")
local naughty = require("naughty")

wifilevel = awful.widget.progressbar()
wifilevel:set_width(5)
wifilevel:set_vertical(true)
wifilevel:set_background_color(nil)
wifilevel:set_border_color(nil)
wifilevel:set_color("#426797")

vicious.register(wifilevel,vicious.widgets.wifi,function(widget,args)
    wifimouseover:set_text(" SSID: " ..  args["{ssid}"] .. "\n" .. " Link: " .. args["{link}"])
    return args["{link}"]
end,17,"wlan0")
