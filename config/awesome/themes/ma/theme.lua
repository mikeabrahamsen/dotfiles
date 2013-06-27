---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [t***REMOVED***list|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.t***REMOVED***list_bg_focus = "#ff0000"

-- Display the t***REMOVED***list squares
theme.t***REMOVED***list_squares_sel   = "/home/ma/.config/awesome/themes/ma/t***REMOVED***list/squarefw.png"
theme.t***REMOVED***list_squares_unsel = "/home/ma/.config/awesome/themes/ma/t***REMOVED***list/squarefw.png"

theme.tasklist_floating_icon = "/home/ma/.config/awesome/themes/ma/tasklist/floating.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/ma/.config/awesome/themes/ma/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the im***REMOVED***e to load
theme.titlebar_close_button_normal = "/home/ma/.config/awesome/themes/ma/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/ma/.config/awesome/themes/ma/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/ma/.config/awesome/themes/ma/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/ma/.config/awesome/themes/ma/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/ma/.config/awesome/themes/ma/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/ma/.config/awesome/themes/ma/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/ma/.config/awesome/themes/ma/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/ma/.config/awesome/themes/ma/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/ma/.config/awesome/themes/ma/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/ma/.config/awesome/themes/ma/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/ma/.config/awesome/themes/ma/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/ma/.config/awesome/themes/ma/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/ma/.config/awesome/themes/ma/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/ma/.config/awesome/themes/ma/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/ma/.config/awesome/themes/ma/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/ma/.config/awesome/themes/ma/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/ma/.config/awesome/themes/ma/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/ma/.config/awesome/themes/ma/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg /home/ma/.config/awesome/themes/ma/background.png" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/ma/.config/awesome/themes/ma/layouts/fairh.png"
theme.layout_fairv = "/home/ma/.config/awesome/themes/ma/layouts/fairv.png"
theme.layout_floating  = "/home/ma/.config/awesome/themes/ma/layouts/floating.png"
theme.layout_m***REMOVED***nifier = "/home/ma/.config/awesome/themes/ma/layouts/m***REMOVED***nifier.png"
theme.layout_max = "/home/ma/.config/awesome/themes/ma/layouts/max.png"
theme.layout_fullscreen = "/home/ma/.config/awesome/themes/ma/layouts/fullscreen.png"
theme.layout_tilebottom = "/home/ma/.config/awesome/themes/ma/layouts/tilebottom.png"
theme.layout_tileleft   = "/home/ma/.config/awesome/themes/ma/layouts/tileleft.png"
theme.layout_tile = "/home/ma/.config/awesome/themes/ma/layouts/tile.png"
theme.layout_tiletop = "/home/ma/.config/awesome/themes/ma/layouts/tiletop.png"
theme.layout_spiral  = "/home/ma/.config/awesome/themes/ma/layouts/spiral.png"
theme.layout_dwindle = "/home/ma/.config/awesome/themes/ma/layouts/dwindle.png"

theme.awesome_icon = "/home/ma/.config/awesome/themes/ma/icons/arch-blue.png"

theme.widget_vol = "/home/ma/.config/awesome/themes/ma/icons/spkr_01.png"
theme.widget_vol_no = "/home/ma/.config/awesome/themes/ma/icons/spkr_02.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
