local wezterm = require "wezterm"
local act = wezterm.action
local mux = wezterm.mux

local operating_system = os.getenv("OS")
local base_path = ""
local projects_path = ""
if operating_system == "Windows_NT" then
  base_path = ";e:\\stproject\\wezterm\\" -- ";" for absolute path
  projects_path = ";e:\\stproject\\wezterm\\projects"
else
  base_path = ";/e/stproject/wezterm/"
  projects_path = ";/e/stproject/wezterm/projects"
end
--wezterm.log_info(os.getenv("WZ_PROJECT"))

local project = require (base_path .. "project")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
  project.startup("WZ_PROJECT", projects_path, wezterm)
end)

-- Avoid spawning login shell that causes starship to always shop the `jobs` module
config.default_prog = { os.getenv("SHELL") }

-- Activate the Launcher Menu in the current tab.
config.keys = {
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

return config