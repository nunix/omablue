-- Omarchy Keybinding Overrides
-- All Omarchy default bindings are loaded via default.hypr.omarchy

-- Hyper-V / VM Compatibility: ALT Fallback Bindings
-- (For when Windows host captures SUPER / Windows key)
o.bind("ALT + RETURN", "Terminal (Alt)", { omarchy = "terminal" })
o.bind("ALT + SPACE", "Omarchy menu (Alt)", "omarchy-menu toggle")
o.bind("ALT + D", "Apps menu (Alt)", "omarchy-menu toggle apps")
o.bind("ALT + Q", "Close window (Alt)", hl.dsp.window.close())
o.bind("ALT + F4", "Close window (Alt)", hl.dsp.window.close())
o.bind("ALT + T", "Theme switcher (Alt)", "omarchy-theme-switcher")
o.bind("ALT + K", "Keybindings (Alt)", "omarchy-menu-keybindings")