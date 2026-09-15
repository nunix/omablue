-- Extra user autostart processes
-- Omarchy core autostart (quickshell, polkit, etc.) runs from default/hypr/autostart.lua

-- WayVNC remote desktop server (port 5900)
hl.on("hyprland.start", function()
  hl.exec_cmd("wayvnc 0.0.0.0 5900")
end)