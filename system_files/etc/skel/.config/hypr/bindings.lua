-- Omarchy Keybinding Overrides
-- Explicit bindings for both SUPER (Meta) and ALT modifiers

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("omarchy-menu toggle"), { description = "Omarchy menu" })
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("omarchy-menu toggle"), { description = "Omarchy menu (Alt)" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("omarchy-menu toggle apps"), { description = "Apps menu" })
hl.bind("ALT + D", hl.dsp.exec_cmd("omarchy-menu toggle apps"), { description = "Apps menu (Alt)" })
hl.bind("SUPER + R", hl.dsp.exec_cmd("omarchy-menu toggle"), { description = "Run menu" })

-- Alt fallback for Terminal (SUPER + RETURN is provided by Omarchy defaults)
hl.bind("ALT + RETURN", hl.dsp.exec_cmd("xdg-terminal-exec"), { description = "Terminal (Alt)" })

-- Window controls & Alt fallbacks
hl.bind("ALT + Q", hl.dsp.window.close(), { description = "Close window (Alt)" })
hl.bind("ALT + F4", hl.dsp.window.close(), { description = "Close window (Alt)" })

hl.bind("SUPER + T", hl.dsp.exec_cmd("omarchy-theme-switcher"), { description = "Theme switcher" })
hl.bind("ALT + T", hl.dsp.exec_cmd("omarchy-theme-switcher"), { description = "Theme switcher (Alt)" })

hl.bind("SUPER + K", hl.dsp.exec_cmd("omarchy-menu-keybindings"), { description = "Keybindings" })
hl.bind("ALT + K", hl.dsp.exec_cmd("omarchy-menu-keybindings"), { description = "Keybindings (Alt)" })
