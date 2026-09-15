-- Omarchy Hyprland Base Configuration (Lua for Hyprland 0.56+)

-- Monitor setup (Fixed 1920x1080 @ 1x scale for Hyper-V / standard display)
hl.monitor({
    output   = "",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = 1,
})

-- Core Autostart
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("/usr/libexec/xfce-polkit")
    hl.exec_cmd("nm-applet --indicator")
end)

-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("AQ_NO_MODIFIERS", "1")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- General Layout & Styling
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding       = 8,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 2,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 5,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
    input = {
        kb_layout  = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Default curves and animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Keybindings (Both SUPER and ALT modifiers for VM & bare metal ergonomics)
local mainMod = "SUPER"
local altMod = "ALT"

-- Terminal (SUPER+Q, SUPER+Return, ALT+Return)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(altMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))

-- Close Window (SUPER+C, ALT+Q, ALT+F4)
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(altMod .. " + Q", hl.dsp.window.close())
hl.bind(altMod .. " + F4", hl.dsp.window.close())

-- Exit / Power
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- File Manager (SUPER+E, ALT+E)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(altMod .. " + E", hl.dsp.exec_cmd("thunar"))

-- Toggle Floating (SUPER+V, ALT+V)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(altMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- App Launcher (SUPER+SPACE, SUPER+R, ALT+SPACE, ALT+D)
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(altMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(altMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))

-- Layouts & Lock
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Audio & Brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 5%-"),                  { locked = true, repeating = true })

-- Media
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Focus Movement (SUPER & ALT arrows)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(altMod .. " + left",   hl.dsp.focus({ direction = "left" }))
hl.bind(altMod .. " + right",  hl.dsp.focus({ direction = "right" }))
hl.bind(altMod .. " + up",     hl.dsp.focus({ direction = "up" }))
hl.bind(altMod .. " + down",   hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-10
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(altMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(altMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Mouse Window Move & Resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(altMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(altMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- Window rules
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
