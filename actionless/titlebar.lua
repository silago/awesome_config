--[[
     Licensed under GNU General Public License v2
      * (c) 2014  Yauheni Kirylau
--]]

local awful = require("awful")
local client = client
local wibox = require("wibox")
local beautiful = require("beautiful")


local titlebar = {}

function titlebar.remove_titlebar(c)
  if titlebar.is_enabled(c) then
    awful.titlebar.hide(c, beautiful.titlebar_position)
    c.skip_taskbar = false
  end
end

function titlebar.remove_border(c)
  titlebar.remove_titlebar(c)
  c.border_width = 0
  --c.border_color = beautiful.border_normal
end

function titlebar.make_titlebar(c)
  if titlebar.is_enabled(c) then
    return
  end
  c.border_color = beautiful.titlebar_focus_border
  -- buttons for the titlebar
  local buttons = awful.util.table.join(
    awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
    end),
    awful.button({ }, 2, function()
            client.focus = c
            c:raise()
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
    end),
    awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
    end)
    )

  local left_layout = wibox.layout.fixed.horizontal()
  left_layout:add(awful.titlebar.widget.closebutton(c))
  left_layout:add(awful.titlebar.widget.minimizebutton(c))
  --left_layout:add(awful.titlebar.widget.maximizedbutton(c))

  local right_layout = wibox.layout.fixed.horizontal()
  right_layout:add(awful.titlebar.widget.ontopbutton(c))
  right_layout:add(awful.titlebar.widget.stickybutton(c))

  local middle_layout = wibox.layout.flex.horizontal()
  local title = awful.titlebar.widget.titlewidget(c)
  title:set_align("center")
  title:set_font(beautiful.titlebar_font)
  middle_layout:add(title)
  middle_layout:buttons(buttons)

  local layout = wibox.layout.align.horizontal()
  layout:set_left(left_layout)
  layout:set_right(right_layout)
  layout:set_middle(middle_layout)

  awful.titlebar(
    c,
    { size=beautiful.titlebar_height or 16,
      position = beautiful.titlebar_position,
      opacity = beautiful.titlebar_opacity }
  ):set_widget(layout)
  c.skip_taskbar = true
end


function titlebar.is_enabled(c)
  if (
    c["titlebar_" .. beautiful.titlebar_position or 'top'
    ](c):geometry()['height'] > 0
  ) then
    return true
  else
    return false
  end
end

function titlebar.titlebar_toggle(c)
  if titlebar.is_enabled(c) then
    titlebar.remove_titlebar(c)
  else
    titlebar.remove_titlebar(c)
    titlebar.make_titlebar(c)
  end
end


return titlebar
