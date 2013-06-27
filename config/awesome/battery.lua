local awful = require("awful")
local vicious = require("vicious")
local naughty = require("naughty")

-- Create a function to return the battery state
function batterystate(state)
    if state == "+" then
        return "Charging"
    end
    if state == "-" then
        return "Discharging" 
    end
    -- For the most part if battery state is unknown it is because I am using an 
    -- artificial battery capacity to extend battery life
    if state == "↯" or state == "⌁" then
        return "Charged"
    end
end


-- Create battery progress bar and widget
batterylevel = awful.widget.progressbar()
batterylevel:set_width(20)
batterylevel:set_vertical(false)
batterylevel:set_background_color("#494B4F")
batterylevel:set_border_color("#426797")
batterylevel:set_color("#426797")

vicious.register(batterylevel,vicious.widgets.bat,function(widget,args)
    bat_state = batterystate(args[1])
    batmouseover:set_text(" State: " .. bat_state .. "\n" ..
            " Charge: " .. args[2] .. "%\n"..
            " Remaining: " .. args[3])
            if args[2] <= 20 and args[3] ~= "N/A" then
                    naughty.notify({ text="Battery is low! " .. args[2] .. " percent remaining." })
            end
    batwidget:set_text(args[2] .. "%")
    return args[2]
end,31,"BAT1")
