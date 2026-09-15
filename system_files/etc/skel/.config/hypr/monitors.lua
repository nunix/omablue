-- Omarchy Monitors Configuration
-- Default 1080p scale 1 for Hyper-V / standard VM and physical displays
local omarchy_monitor_scale = 1
hl.monitor({ output = "", mode = "1920x1080@60", position = "auto", scale = omarchy_monitor_scale })

-- GDK scale for crisp GTK rendering without fractional stretching
local omarchy_gdk_scale = 1
hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.env("AQ_NO_MODIFIERS", "1")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- Session-scoped disabled displays
local runtime_dir = os.getenv("XDG_RUNTIME_DIR") or ("/run/user/" .. tostring(os.getenv("UID") or "1000"))
local disabled_state_file = io.open(runtime_dir .. "/omarchy-disabled-monitors.txt", "r")
if disabled_state_file then
  for line in disabled_state_file:lines() do
    local mon_name = line:match("^%s*(.-)%s*$")
    if mon_name and mon_name ~= "" then
      hl.monitor({ output = mon_name, disabled = true })
    end
  end
  disabled_state_file:close()
end