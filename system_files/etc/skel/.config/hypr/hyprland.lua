-- Omarchy Quattro Hyprland Configuration

local home = os.getenv("HOME") or "/var/home/nunix"
local omarchy_path = os.getenv("OMARCHY_PATH")

local function find_omarchy_path()
  if omarchy_path then
    local f = io.open(omarchy_path .. "/default/hypr/omarchy.lua", "r")
    if f then
      f:close()
      return omarchy_path
    end
  end
  local f = io.open("/usr/share/omarchy/default/hypr/omarchy.lua", "r")
  if f then
    f:close()
    return "/usr/share/omarchy"
  end
  return home .. "/.local/share/omarchy"
end

omarchy_path = find_omarchy_path()

-- Bootstrap Omarchy's Lua module path
dofile(omarchy_path .. "/default/hypr/bootstrap.lua")

-- Load Omarchy defaults
require("default.hypr.omarchy")

-- User modular overrides
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Dynamic toggles
require("default.hypr.toggles")