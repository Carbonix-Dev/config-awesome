-- Awesome Libs
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local ruled = require("ruled")

local modkey = user_vars.modkey

return gears.table.join(
  awful.key(
    { "Control", "Mod1" },
    "Delete",
    function()
      awesome.emit_signal("module::powermenu:show")
    end,
    { description = "Power Menu", group = "System" }
  ),
  awful.key(
    { modkey, "Shift" },
    "/",
    hotkeys_popup.show_help,
    { description = "Keyboard Shortcuts", group = "System" }
  ),
  -- Tag browsing
  awful.key(
    { modkey },
    "#113",
    awful.tag.viewprev,
    { description = "View previous tag", group = "Tag" }
  ),
  awful.key(
    { modkey },
    "#114",
    awful.tag.viewnext,
    { description = "View next tag", group = "Tag" }
  ),
  awful.key(
    { modkey },
    "#66",
    awful.tag.history.restore,
    { description = "Go back to last tag", group = "Tag" }
  ),
  awful.key(
    { modkey },
    "#44",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "Focus next client by index", group = "Client" }
  ),
  awful.key(
    { modkey },
    "#45",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "Focus previous client by index", group = "Client" }
  ),
  awful.key(
    { modkey, "Shift" },
    "#44",
    function()
      awful.client.swap.byidx(1)
    end,
    { description = "Swap with next client by index", group = "Client" }
  ),
  awful.key(
    { modkey, "Shift" },
    "#45",
    function()
      awful.client.swap.byidx(-1)
    end,
    { description = "Swap with previous client by index", group = "Client" }
  ),
  awful.key(
    { modkey, "Control" },
    "#44",
    function()
      awful.screen.focus_relative(1)
    end,
    { description = "Focus the next screen", group = "Screen" }
  ),
  awful.key(
    { modkey, "Control" },
    "#45",
    function()
      awful.screen.focus_relative(-1)
    end,
    { description = "Focus the previous screen", group = "Screen" }
  ),
  awful.key(
    { modkey },
    "#30",
    awful.client.urgent.jumpto,
    { description = "Jump to urgent client", group = "Client" }
  ),
  awful.key(
    { modkey },
    "t",
    function()
      awful.spawn(user_vars.terminal)
    end,
    { description = "Open terminal", group = "Applications" }
  ),
  awful.key(
    { modkey, "Control" },
    "r",
    function()
      awful.spawn([[ killall onedrive_tray ]])
      awesome.restart()
    end,
    { description = "Reload AwesomeWM", group = "System" }
  ),
  awful.key(
    { modkey },
    "r",
    function()
      awful.spawn([[ rofi -show run ]])
    end,
    { description = "Show run dialog", group = "System" }
  ),
  awful.key(
    { modkey },
    ".",
    function()
      awful.spawn([[ emote ]])
    end,
    { description = "Open Emoji Picker", group = "System" }
  ),
  awful.key(
    { modkey },
    "#46",
    function()
      awful.tag.incmwfact(0.05)
    end,
    { description = "Increase client width", group = "Layout" }
  ),
  awful.key(
    { modkey },
    "#43",
    function()
      awful.tag.incmwfact(-0.05)
    end,
    { description = "Decrease client width", group = "Layout" }
  ),
  awful.key(
    { modkey, "Control" },
    "#43",
    function()
      awful.tag.incncol(1, nil, true)
    end,
    { description = "Increase the number of columns", group = "Layout" }
  ),
  awful.key(
    { modkey, "Control" },
    "#46",
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    { description = "Decrease the number of columns", group = "Layout" }
  ),
  awful.key(
    { modkey, "Shift" },
    "#65",
    function()
      awful.layout.inc(-1)
    end,
    { description = "Select previous layout", group = "Layout" }
  ),
  awful.key(
    { modkey, "Shift" },
    "#36",
    function()
      awful.layout.inc(1)
    end,
    { description = "Select next layout", group = "Layout" }
  ),
  awful.key(
    { modkey },
    "s",
    function()
      awful.spawn("rofi -show drun -theme ~/.config/rofi/rofi.rasi")
    end,
    { descripton = "Application launcher", group = "Application" }
  ),
  awful.key(
    { modkey },
    "#23",
    function()
      awful.spawn("rofi -show window -theme ~/.config/rofi/window.rasi")
    end,
    { descripton = "Window switcher", group = "Applications" }
  ),
  awful.key(
    { "Mod1" },
    "#23",
    function()
      awful.spawn("rofi -show window -theme ~/.config/rofi/window.rasi")
    end,
    { descripton = "Window switcher", group = "Applications" }
  ),
  awful.key(
    { modkey },
    "e",
    function()
      awful.spawn(user_vars.file_manager)
    end,
    { descripton = "Open file manager", group = "Applications" }
  ),
  awful.key(
    { modkey, "Shift" },
    "#26",
    function()
      awesome.emit_signal("module::powermenu:show")
    end,
    { descripton = "Session options", group = "System" }
  ),
  awful.key(
    { modkey },
    "#123",
    function()
      awful.spawn(user_vars.screenshot_program)
    end,
    { description = "Screenshot", group = "Applications" }
  ),
  awful.key(
    {},
    "XF86AudioLowerVolume",
    function(c)
      awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ -2%", function()
        awesome.emit_signal("module::volume_osd:show", true)
        awesome.emit_signal("module::slider:update")
        awesome.emit_signal("widget::volume_osd:rerun")
      end)
    end,
    { description = "Lower volume", group = "System" }
  ),
  awful.key(
    {},
    "XF86AudioRaiseVolume",
    function(c)
      awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ +2%", function()
        awesome.emit_signal("module::volume_osd:show", true)
        awesome.emit_signal("module::slider:update")
        awesome.emit_signal("widget::volume_osd:rerun")
      end)
    end,
    { description = "Increase volume", group = "System" }
  ),
  awful.key(
    {},
    "XF86AudioMute",
    function(c)
      awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
      awesome.emit_signal("module::volume_osd:show", true)
      awesome.emit_signal("module::slider:update")
      awesome.emit_signal("widget::volume_osd:rerun")
    end,
    { description = "Mute volume", group = "System" }
  ),
  awful.key(
    {},
    "XF86MonBrightnessUp",
    function(c)
      --awful.spawn("xbacklight -time 100 -inc 1%+")
      awful.spawn.easy_async_with_shell(
        "pkexec xfpm-power-backlight-helper --get-brightness",
        function(stdout)
          -- awful.spawn.easy_async_with_shell("pkexec xfpm-power-backlight-helper --set-brightness " .. tostring(tonumber(stdout) + BACKLIGHT_SEPS), function(stdou2)
          
          -- end)
          awful.spawn("xbacklight -time 150 -inc 1%+")
          awesome.emit_signal("module::brightness_osd:show", true)
          awesome.emit_signal("module::brightness_slider:update")
          awesome.emit_signal("widget::brightness_osd:rerun")
        end
      )
    end,
    { description = "Raise backlight brightness", group = "System" }
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    function(c)
      awful.spawn.easy_async_with_shell(
        "pkexec xfpm-power-backlight-helper --get-brightness",
        function(stdout)
          -- awful.spawn.easy_async_with_shell("pkexec xfpm-power-backlight-helper --set-brightness " .. tostring(tonumber(stdout) - BACKLIGHT_SEPS), function(stdout2)

          -- end)
          awful.spawn("xbacklight -time 150 -dec 1%+")
          awesome.emit_signal("module::brightness_osd:show", true)
          awesome.emit_signal("module::brightness_slider:update")
          awesome.emit_signal("widget::brightness_osd:rerun")
        end
      )
    end,
    { description = "Lower backlight brightness", group = "System" }
  ),
  awful.key(
    {},
    "XF86AudioPlay",
    function(c)
      awful.spawn("playerctl play-pause")
    end,
    { description = "Play / Pause audio", group = "System" }
  ),
  awful.key(
    {},
    "XF86AudioNext",
    function(c)
      awful.spawn("playerctl next")
    end,
    { description = "Play / Pause audio", group = "System" }
  ),
  awful.key(
    {},
    "XF86AudioPrev",
    function(c)
      awful.spawn("playerctl previous")
    end,
    { description = "Play / Pause audio", group = "System" }
  ),
  awful.key(
    { modkey },
    "#65",
    function()
      awesome.emit_signal("kblayout::toggle")
    end,
    { description = "Toggle keyboard layout", group = "System" }
  ),
  awful.key(
    { modkey },
    "#22",
    function()
      awful.spawn.easy_async_with_shell(
        [[xprop | grep WM_CLASS | awk '{gsub(/"/, "", $4); print $4}']],
        function(stdout)
          if stdout then
            ruled.client.append_rule {
              rule = { class = stdout:gsub("\n", "") },
              properties = {
                floating = true
              },
            }
            awful.spawn.easy_async_with_shell(
              "cat ~/.config/awesome/src/assets/rules.txt",
              function(stdout2)
                for class in stdout2:gmatch("%a+") do
                  if class:match(stdout:gsub("\n", "")) then
                    return
                  end
                end
                awful.spawn.with_shell("echo -n '" .. stdout:gsub("\n", "") .. ";' >> ~/.config/awesome/src/assets/rules.txt")
                local c = mouse.screen.selected_tag:clients()
                for j, client in ipairs(c) do
                  if client.class:match(stdout:gsub("\n", "")) then
                    client.floating = true
                  end
                end
              end
            )
          end
        end
      )
    end
  ),
  awful.key(
    { modkey, "Shift" },
    "#22",
    function()
      awful.spawn.easy_async_with_shell(
        [[xprop | grep WM_CLASS | awk '{gsub(/"/, "", $4); print $4}']],
        function(stdout)
          if stdout then
            ruled.client.append_rule {
              rule = { class = stdout:gsub("\n", "") },
              properties = {
                floating = false
              },
            }
            awful.spawn.easy_async_with_shell(
              [[
                                REMOVE="]] .. stdout:gsub("\n", "") .. [[;"
                                STR=$(cat ~/.config/awesome/src/assets/rules.txt)
                                echo -n ${STR//$REMOVE/} > ~/.config/awesome/src/assets/rules.txt
                            ]],
              function(stdout2)
                local c = mouse.screen.selected_tag:clients()
                for j, client in ipairs(c) do
                  if client.class:match(stdout:gsub("\n", "")) then
                    client.floating = false
                  end
                end
              end
            )
          end
        end
      )
    end
  )
)
