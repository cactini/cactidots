--
-- Autostart
--
local terminal = "kitty"
local browser = "firefox"

hl.on("hyprland.start", function()
    -- Cursor setup
    hl.exec_cmd("hyprctl setcursor \"Banana\" 10")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme \"Banana\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 10")

    -- Clipboard manager daemons
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Wallpaper and bar
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")

    -- Idle daemon
    hl.exec_cmd("hypridle")

    -- Startup apps with workspace targeting
    hl.exec_cmd(terminal,  { workspace = "1" })
    hl.exec_cmd("obsidian", { workspace = "2"})
    hl.exec_cmd(browser,    { workspace = "3"})
end)
