--
-- Windowrules
--

hl.window_rule({match = {class = "kitty"}, workspace = 1})
hl.window_rule({match = {class = "obsidian"}, workspace = 2})
hl.window_rule({match = {class = "firefox-bin"}, workspace = 3})
hl.window_rule({match = {class = "discord"}, workspace = 4})
hl.window_rule({match = {class = "org.telegram.desktop"}, workspace = 4})
hl.window_rule({match = {class = "steam"}, workspace = 5})

hl.layer_rule({ name = "selection-layer-no-anim", match = { namespace = "selection" }, no_anim = true,})
