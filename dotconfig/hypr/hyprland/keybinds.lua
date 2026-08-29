--
-- Keybinds
--

-- Binds
hl.config({
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles   = true,
    },
})

-- SUPAH
local mod = "SUPER"
local modshift = "SUPER + SHIFT"
local terminal = "kitty"
local fileman = "yazi"
local menu = "rofi -show run"
local browser = "firefox"
local taskman = "btop"
local colorpicker = "hyprpicker"

hl.bind(mod .. " + W", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mod .. " + G", hl.dsp.window.fullscreen({ mode = 0 }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(terminal .. " " .. fileman))

hl.bind(mod .. " + P", hl.dsp.exec_cmd("~/.config/rofi/powermenu/powermenu.sh"))
hl.bind(mod .. " + space", hl.dsp.exec_cmd("~/.config/rofi/launcher/launcher.sh"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/clipboard/launcher.sh"))
hl.bind(mod .. " + A", hl.dsp.exec_cmd("~/.config/rofi/wifi/wifi.sh"))
hl.bind(modshift .. " + R", hl.dsp.exec_cmd("~/.config/rofi/wallselect/script.sh && hyprpaper"))

hl.bind(modshift .. " + S", hl.dsp.exec_cmd("grimblast -n copy area"))
hl.bind("PRINT", hl.dsp.exec_cmd("grimblast -n copysave area"))
hl.bind("ALT + SHIFT" .. " + S", hl.dsp.exec_cmd("grimblast -f -n copy area"))

hl.bind(mod .. " + CTRL + ALT".. " + TAB", hl.dsp.exec_cmd(terminal .. " " .. taskman))
hl.bind(mod .. " + C", hl.dsp.exec_cmd(colorpicker .. " -a"))
hl.bind(modshift .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("pamixer -i 2 && ~/.local/bin/volume.sh"))
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("pamixer -d 2 && ~/.local/bin/volume.sh"))
hl.bind("xf86AudioMute", hl.dsp.exec_cmd("pamixer -t && dunstify -i ~/.config/dunst/assets/$(pamixer --get-mute | grep -q \"true\" && echo \"volume-mute.svg\" || echo \"volume.svg\") -t 500 -r 2593 \"Toggle Mute\""))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previus"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 2%- && ~/.local/bin/brightness.sh"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +2% && ~/.local/bin/brightness.sh"))
