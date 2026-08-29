--
-- Look and Feel
--

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 6,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgb(8aadf4)", "rgb(24273a)", "rgb(24273a)", "rgb(8aadf4)"}, angle = 45 },
            inactive_border = "rgb(24273a)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        extend_border_grab_area = 30,
        hover_icon_on_border = true,
        resize_corner = 5,

        layout = "dwindle",
    },

    decoration = {
        dim_special = 0.2,
        rounding       = 6,
        rounding_power = 2,

        -- Normal opacity
        active_opacity   = 0.9,
        inactive_opacity = 0.7,
        --[[
        -- Study opacity
        active_opacity = 1,
        inactive_opacity = 0.9,
        --]]

        blur = {
            enabled   = true,
            size      = 4,
            popups = true,
            passes    = 4,
            vibrancy  = 0.3,
            ignore_opacity = true,
            special = true,
        },

        shadow = {
            enabled      = false,
            range        = 300,
            render_power = 3,
            color        = "rgba(1a1a1aaf)",
            offset = {10, 10},
        },
    },

    animations = {
        enabled = true,
    },
})
