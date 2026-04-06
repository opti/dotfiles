-- Wezterm multiplexing configuration (replaces tmux)
-- Only loaded when tmux is not running

local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
	config.tab_bar_at_bottom = true

	-- Leader key: CTRL+A (matches tmux prefix)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	-- Nvim-aware pane navigation (requires smart-splits.nvim setting IS_NVIM user var)
	local function is_vim(pane)
		return pane:get_user_vars().IS_NVIM == "true"
	end

	local direction_keys = {
		LeftArrow = "Left",
		DownArrow = "Down",
		UpArrow = "Up",
		RightArrow = "Right",
	}

	local function split_nav(key)
		return {
			key = key,
			mods = "CTRL",
			action = wezterm.action_callback(function(win, pane)
				if is_vim(pane) then
					win:perform_action({ SendKey = { key = key, mods = "CTRL" } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end),
		}
	end

	config.keys = {
		-- Splits (matches tmux: prefix+| and prefix+_)
		{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Pane zoom (matches tmux: prefix+m)
		{ mods = "LEADER", key = "m", action = act.TogglePaneZoomState },

		-- Pane resize (matches tmux: prefix+h/j/k/l, 5 cells)
		{ mods = "LEADER", key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ mods = "LEADER", key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ mods = "LEADER", key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ mods = "LEADER", key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },

		-- Pane navigation: CTRL+Arrow (nvim-aware, matches tmux vim-navigator config)
		split_nav("LeftArrow"),
		split_nav("DownArrow"),
		split_nav("UpArrow"),
		split_nav("RightArrow"),

		-- Tabs (prefix+c=new, prefix+p/n=prev/next, prefix+1-9=jump)
		{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
		{ mods = "LEADER", key = "p", action = act.ActivateTabRelative(-1) },
		{ mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
		{ mods = "LEADER", key = "1", action = act.ActivateTab(0) },
		{ mods = "LEADER", key = "2", action = act.ActivateTab(1) },
		{ mods = "LEADER", key = "3", action = act.ActivateTab(2) },
		{ mods = "LEADER", key = "4", action = act.ActivateTab(3) },
		{ mods = "LEADER", key = "5", action = act.ActivateTab(4) },
		{ mods = "LEADER", key = "6", action = act.ActivateTab(5) },
		{ mods = "LEADER", key = "7", action = act.ActivateTab(6) },
		{ mods = "LEADER", key = "8", action = act.ActivateTab(7) },
		{ mods = "LEADER", key = "9", action = act.ActivateTab(8) },

		-- Move tabs (matches tmux: Ctrl+Shift+Left/Right)
		{ mods = "CTRL|SHIFT", key = "LeftArrow", action = act.MoveTabRelative(-1) },
		{ mods = "CTRL|SHIFT", key = "RightArrow", action = act.MoveTabRelative(1) },

		-- Vi copy mode (matches tmux: prefix+[ to enter, v/y work by default)
		{ mods = "LEADER", key = "[", action = act.ActivateCopyMode },

		-- Clear scrollback + screen (matches tmux Ctrl-l binding)
		{
			key = "l",
			mods = "CTRL",
			action = act.Multiple({
				act.SendKey({ key = "l", mods = "CTRL" }),
				act.ClearScrollback("ScrollbackAndViewport"),
			}),
		},

		-- Reload config (matches tmux: prefix+r)
		{ mods = "LEADER", key = "r", action = act.ReloadConfiguration },

		-- Lazygit in new tab (prefix+g)
		{ mods = "LEADER", key = "g", action = act.EmitEvent("open-lazygit") },

		-- Send CTRL+A to shell when pressed twice (matches tmux: prefix prefix)
		{ mods = "LEADER", key = "a", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	}

	-- Mouse: complete selection or open link on click
	config.mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
		},
	}

	-- Status bar via tabline.wez
	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	tabline.setup({
		options = {
			theme = "Tokyo Night",
			tabs_enabled = true,
			theme_overrides = {
				normal_mode = {
					a = { fg = "#1a1b26", bg = "#a6e3a1" },
					b = { fg = "#c0caf5", bg = "#292e42" },
					c = { fg = "#a9b1d6", bg = "#1a1b26" },
				},
				copy_mode = {
					a = { fg = "#1a1b26", bg = "#f9e2af" },
					b = { fg = "#c0caf5", bg = "#292e42" },
					c = { fg = "#a9b1d6", bg = "#1a1b26" },
				},
				search_mode = {
					a = { fg = "#1a1b26", bg = "#7dcfff" },
					b = { fg = "#c0caf5", bg = "#292e42" },
					c = { fg = "#a9b1d6", bg = "#1a1b26" },
				},
				tab = {
					active = { fg = "#a6e3a1", bg = "#292e42" },
					inactive = { fg = "#565f89", bg = "#1a1b26" },
					inactive_hover = { fg = "#c0caf5", bg = "#292e42" },
				},
			},
			section_separators = {
				left = " ",
				right = " ",
			},
			component_separators = { left = "", right = "" },
			tab_separators = {
				left = wezterm.nerdfonts.ple_right_half_circle_thick,
				right = wezterm.nerdfonts.ple_left_half_circle_thick,
			},
		},
		sections = {
			tabline_a = { "workspace" },
			tabline_b = {},
			tabline_c = {},
			tab_active = {
				"index",
				{ "process", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = {
				"index",
				{ "process", padding = { left = 0, right = 1 } },
			},
			tabline_x = {},
			tabline_y = {},
			tabline_z = { "datetime" },
		},
		extensions = {},
	})
	tabline.apply_to_config(config)

	-- Workspace picker: fuzzy switch/create/rename workspaces (with zoxide integration)
	local workspace_picker = wezterm.plugin.require("https://github.com/vdmgolub/workspace_picker.wezterm")
	workspace_picker.setup({
		colors = {
			workspace_prefix = "#a6e3a1",
			zoxide_prefix = "#f38ba8",
			current_indicator = "#a6e3a1",
			text = "#cdd6f4",
			path = "#6c7086",
		},
		keybinds = {
			show_picker = { mods = "LEADER", key = "s" },
			create_workspace = { mods = "LEADER", key = "S" },
			rename_workspace = { mods = "LEADER", key = "R" },
		},
	})
	workspace_picker.apply_to_config(config)

	-- Lazygit: opens in new tab at current directory, returns to original tab on exit
	local function get_cwd(pane)
		local cwd_uri = pane:get_current_working_dir()
		if cwd_uri then
			return cwd_uri.file_path
		end
		return wezterm.home_dir
	end

	wezterm.on("open-lazygit", function(window, pane)
		local cwd = get_cwd(pane)
		local tab_id = window:active_tab():tab_id()

		window:perform_action(
			act.SpawnCommandInNewTab({
				args = {
					"/bin/sh",
					"-c",
					string.format("/opt/homebrew/bin/lazygit; wezterm cli activate-tab --tab-id %d", tab_id),
				},
				cwd = cwd,
				set_environment_variables = {
					PATH = os.getenv("PATH") .. ":/usr/local/bin:/opt/homebrew/bin",
				},
			}),
			pane
		)
	end)
end

return M
