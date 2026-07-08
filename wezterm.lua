local wezterm = require("wezterm")
local m = os.getenv("WEZTERM_MODE")
return {
	background = {
		{
			source = {
				File = (m == "RESIZE") and "~/your_wallpaper .gif or png or jpg "
					or "~/your_wallpaper .gif or png  or jpg ",
			},
			width = "100%",
			height = "100%",
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			opacity = 0.6,
			hsb = { brightness = 1 },
		},
	},
	colors = {
		foreground = "#ffffff",
	},
	window_background_opacity = 1,
	font = wezterm.font("Monospace"),
	font_size = 10.0,
	window_background_image_hsb = {
		brightness = 1.0,
		saturation = 1.0,
		hue = 1.0,
	},
	enable_wayland = false,
	window_padding = { left = 6, right = 0, top = 1, bottom = 0 },
	window_close_confirmation = "NeverPrompt",
	window_decorations = (m == "TITLE") and "TITLE" or "RESIZE",
	-- Multiplexer
	-- old session of terminal [like git history]
	unix_domains = { { name = "unix", socket_path = "/tmp/wezterm.sock" } },
	default_gui_startup_args = { "connect", "unix" },
	keys = {
		{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.DetachDomain({ DomainName = "unix" }) },
		{ key = "s", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "DOMAINS" }) },
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnCommandInNewTab({ args = { "wezterm", "cli", "kill-server" } }),
		},
		{
			key = "%",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
		},
		{
			key = '"',
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
		},
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "LeftArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "UpArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "DownArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	},
}
