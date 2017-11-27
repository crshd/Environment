--
-- Hyper is back! Long live Space Cadet!
hyper = {"cmd", "alt", "ctrl", "shift"}

-- X11 color map
col = hs.drawing.color.x11

--------------------------------------------------------------------------------
-- SpoonInstall
--------------------------------------------------------------------------------

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.zzspoons = {
	url = "https://github.com/zzamboni/zzSpoons",
	desc = "zzamboni's spoon repository"
}

spoon.SpoonInstall.use_syncinstall = true

--------------------------------------------------------------------------------

-- http://hammerspoon.org/Spoons/WindowGrid.html
spoon.SpoonInstall:andUse("WindowGrid",
	{
		config = { gridGeometries = { { "5x3" } } },
		hotkeys = { show_grid = {hyper, "g"} },
		start = true
	}
)

--------------------------------------------------------------------------------

-- http://zzamboni.org/zzSpoons/Hammer.html
spoon.SpoonInstall:andUse("Hammer",
	{
		repo = 'zzspoons',
		config = { auto_reload_config = true },
		hotkeys = {
			config_reload = {hyper, "r"},
			toggle_console = {hyper, "c"}
		},
		start = true
	}
)

--------------------------------------------------------------------------------

-- http://hammerspoon.org/Spoons/Emojis.html
spoon.SpoonInstall:andUse("Emojis",
	{
		hotkeys = { toggle = {hyper, "e"} }
	}
)

--------------------------------------------------------------------------------

-- http://hammerspoon.org/Spoons/TextClipboardHistory.html
spoon.SpoonInstall:andUse("TextClipboardHistory",
	{
		config = { show_in_menubar = false },
		hotkeys = { toggle_clipboard = {{"cmd", "shift"}, "v"} },
		start = true
	}
)

--------------------------------------------------------------------------------
-- Abandon Spoon. This is where the fun starts.
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "h", hs.hints.windowHints)

-- Tabs
local tabs = require("tabs")
tabs.enableForApp("Sublime Text")
