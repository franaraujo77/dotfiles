local wezterm = require 'wezterm'
local mux = wezterm.mux

-- this is called by the mux server when it starts up.
-- It makes a window split top/bottom
wezterm.on('mux-startup', function()
  local tab, pane, window = mux.spawn_window {}
  pane:split { direction = 'Top' }
end)

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return {
	-- default_prog = { "/opt/homebrew/bin/nu" }, -- Or the full path if 'nu' isn't in your PATH

	-- Start tmux
	--default_prog = { "/bin/zsh", "-l", "-c", "--", "/opt/homebrew/bin/tmux new-session -As 0" },

	-- Do not ask for permission to close WezTerm
	window_close_confirmation = "NeverPrompt",
	skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "tmux" },

	unix_domains = {
		{ name = 'unix' },
	},

	adjust_window_size_when_changing_font_size = false,
	-- color_scheme = 'termnial.sexy',
	color_scheme = 'Catppuccin Mocha',
	enable_tab_bar = false,
	font_size = 16.0,
	font = wezterm.font('JetBrains Mono'),
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 30,
	
	-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },
	-- window_background_opacity = 0.92,
	window_background_opacity = 0.88,
	-- window_background_opacity = 0.78,
	-- window_background_opacity = 0.20,
	window_decorations = 'RESIZE',
	keys = {
		{
			key = 'q',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = '\'',
			mods = 'CTRL',
			action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
		},
	},
	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  {
	    event = { Up = { streak = 1, button = 'Left' } },
	    mods = 'CTRL',
	    action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}
