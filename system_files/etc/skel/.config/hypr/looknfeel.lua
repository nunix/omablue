-- Omarchy Look & Feel Overrides
-- Performance profile optimized for Virtual Machines and VNC/RDP remote sessions

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 4,
    border_size = 2,
    allow_tearing = false,
  },

  decoration = {
    rounding = 4,
    dim_inactive = false,
    blur = {
      enabled = false,
    },
    shadow = {
      enabled = false,
    },
  },

  animations = {
    enabled = false,
  },

  misc = {
    vfr = true,
    vrr = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },

  render = {
    direct_scanout = false,
    explicit_sync = 0,
  },
})