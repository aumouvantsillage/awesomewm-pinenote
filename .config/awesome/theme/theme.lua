---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = os.getenv("HOME") .. "/.config/awesome/theme"

local theme = {}

theme.font          = "Inter Regular 24"

theme.bg_normal     = "#ffffff"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#eeeeee" --TODO test
theme.bg_minimize   = "#dddddd" --TODO test
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#000000"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#111111" --TODO test
theme.fg_minimize   = "#222222" --TODO test

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = theme.border_normal
theme.border_marked = theme.border_normal

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.hotkeys_font = "Inter Regular 20"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.taglist_spacing = dpi(12)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path .. "/submenu.png"
theme.menu_height = dpi(60)
theme.menu_width  = dpi(400)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = theme_path .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme_path .. "/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = theme_path .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme_path .. "/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = theme_path .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme_path .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme_path .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme_path .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme_path .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme_path .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme_path .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme_path .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme_path .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme_path .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme_path .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme_path .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme_path .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme_path .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme_path .. "/titlebar/maximized_focus_active.png"

theme.wallpaper = theme_path .. "/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = theme_path .. "/layouts/fairh.png"
theme.layout_fairv      = theme_path .. "/layouts/fairv.png"
theme.layout_floating   = theme_path .. "/layouts/floating.png"
theme.layout_magnifier  = theme_path .. "/layouts/magnifier.png"
theme.layout_max        = theme_path .. "/layouts/max.png"
theme.layout_fullscreen = theme_path .. "/layouts/fullscreen.png"
theme.layout_tilebottom = theme_path .. "/layouts/tilebottom.png"
theme.layout_tileleft   = theme_path .. "/layouts/tileleft.png"
theme.layout_tile       = theme_path .. "/layouts/tile.png"
theme.layout_tiletop    = theme_path .. "/layouts/tiletop.png"
theme.layout_spiral     = theme_path .. "/layouts/spiral.png"
theme.layout_dwindle    = theme_path .. "/layouts/dwindle.png"
theme.layout_cornernw   = theme_path .. "/layouts/cornernw.png"
theme.layout_cornerne   = theme_path .. "/layouts/cornerne.png"
theme.layout_cornersw   = theme_path .. "/layouts/cornersw.png"
theme.layout_cornerse   = theme_path .. "/layouts/cornerse.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
