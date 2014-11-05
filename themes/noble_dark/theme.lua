local generate_theme = require("actionless.common_theme").generate_theme
local xresources = require("actionless.xresources")
local h_table = require("actionless.table")

local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/noble_dark"

local gtk = {}

--gtk.bg = "#3d3e40"
--gtk.base = "#2b2b2c"

gtk.bg = "#454749"
gtk.base = "#2b2b2c"

gtk.fg = "#f3f3f5"
gtk.select = "#ad7fa8"

-- TERMINAL COLORSCHEME:
--
local color = xresources.get_current_theme()
color.b  = gtk.bg
color.f  = gtk.fg
color[0]  = gtk.base
color[4]  = gtk.select
color[7]  = gtk.fg

-- PANEL COLORS:
--
panel_colors = {
  taglist='b',
  close=0,
  tasklist='b',
  media=0,
  info=0
}

-- GENERATE DEFAULT THEME:
--
local theme = generate_theme(
  theme_dir,
  color,
  panel_colors
)

theme.panel_enbolden_details	= true

theme.theme = gtk.select
theme.warning = gtk.select

theme.border_width              = "8"
theme.border_focus              = "#94a870"
theme.border_focus              = "#a6e22e"
theme.border_focus              = "#a3c24e"
theme.titlebar_focus_border     = theme.border_focus


theme.panel_widget_fg = gtk.fg
theme.panel_widget_bg = gtk.bg
theme.panel_opacity = 1
theme.taglist_fg_occupied	= gtk.fg
theme.taglist_fg_empty		= gtk.fg
theme.taglist_fg_focus		= gtk.fg

theme.taglist_bg_focus		= gtk.base
theme.tasklist_fg_focus		= gtk.fg
theme.tasklist_fg_minimize	= color[8]
theme.tasklist_bg_minimize	= gtk.base

theme.titlebar_fg_focus         = theme.tasklist_fg_focus
theme.titlebar_fg_normal        = color[8]

theme.naughty_preset.bg = gtk.base
theme.naughty_preset.bg = "#111111"
theme.naughty_preset.border_color = theme.naughty_preset.bg
theme.naughty_mono_preset = h_table.deepcopy(theme.naughty_preset)

theme.player_artist = gtk.select
theme.player_title = gtk.fg

-- CUSTOMIZE default theme:-----------------------------------------------

-- WALLPAPER:
-- Use nitrogen:
theme.wallpaper_cmd     = "nitrogen --restore"
-- Use wallpaper tile:
--theme.wallpaper = theme_dir .. '/pattern.png'

-- PANEL DECORATIONS:
--
theme.widget_decoration_arrl = 'sq'
theme.widget_decoration_arrr = 'sq'
--theme.widget_decoration_arrl = ''
--theme.widget_decoration_arrr = ''

theme.show_widget_icon = true
------------------------------------------------------------------------------
-- FONTS:
--Ubuntu patches:
--theme.font = "Monospace 10.5"
--theme.sans_font = "Sans 10.3"
--theme.tasklist_font = "Sans Bold 10.3"

theme.font = "Monospace 10"
theme.sans_font = "Sans 10"
-- Don't use sans font:
--theme.sans_font	= theme.font
--
theme.tasklist_font = "Sans Bold 10"
theme.titlebar_font = theme.tasklist_font
theme.taglist_font = theme.font
theme.naughty_preset.font = theme.sans_font
theme.naughty_mono_preset.font = theme.font

return theme
