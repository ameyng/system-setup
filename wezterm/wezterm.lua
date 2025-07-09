-- Import the 'WezTerm' API using a protected call.
local weztermStatus, wezterm = pcall(require, 'wezterm')

-- Check if the module was imported successfully.
-- If not, stop processing the configuration.
-- This usually means that there was some error while installing 'WezTerm'.
if not weztermStatus then

  -- Exit, as we cannot proceed without the 'wezterm' module being loaded.
  return

else

  -- Register a new event handler to execute right after the GUI is started.
  wezterm.on('gui-attached', function(muxDomain)

    -- Initialize a new multiplexer object.
    local thisMux = wezterm.mux

    -- Initialize the local workspace.
    local thisWorkspace = thisMux.get_active_workspace()

    -- Iterate over all windows connected to this multiplexer session.
    for _, window in ipairs(thisMux.all_windows()) do

      -- Check if the window being iterated over belongs to the current workspace.
      if window:get_workspace() == thisWorkspace then

	-- Maximize the window.
	window:gui_window():maximize()

      end

    end

  end

  )

  -- Modifier key --
  ------------------
  -- A platform specific key that is used to trigger various keyboard actions.
  local modifierKey = nil

  -- On MacOS, use the 'Command' key.
  if ( ( wezterm.target_triple == 'x86_64-apple-darwin' ) or ( wezterm.target_triple == 'aarch64-apple-darwin' ) ) then
    modifierKey = 'CMD'
  -- On other systems (Windows and GNU/Linux), use the 'Alt/Meta' key.
  else
    modifierKey = 'ALT'
  end

  -- Combine this 'modifierKey' with 'Shift'.
  -- This is mainly to avoid conflicts with OS keybindings/shortcuts.
  modifierKey = modifierKey .. '|SHIFT'

  -- Initialize an empty configuration structure using the built-in function 'config_builder()'.
  local config = wezterm.config_builder()

  config = {

    -- General --
    -------------
    check_for_updates = false,
    default_cwd = os.getenv('HOME'),
    disable_default_key_bindings = true,
    disable_default_mouse_bindings = true,
    scrollback_lines = 100000,

    -- Bells --
    -----------
    audible_bell = 'Disabled',
    visual_bell = {
      fade_in_duration_ms = 0,
      fade_out_duration_ms = 0
    },

    -- Appearance --
    ----------------
    warn_about_missing_glyphs = false,
    default_cursor_style = 'SteadyBlock',
    hide_mouse_cursor_when_typing = true,
    show_tab_index_in_tab_bar = false,
    enable_scroll_bar = false,
    window_padding = {
      left = 0,
      right = '0.8%',
      top = 0,
      bottom = 0
    },
    colors = {
      foreground = '#e0e2ea',
      background = '#14161b',
      cursor_bg = '#9b9ea4',
      cursor_fg = '#e0e2ea',
      cursor_border = '#9b9ea4',
      selection_fg = '#e0e2ea',
      selection_bg = '#4f5258',
      ansi = {
        '#07080d',
	'#ffc0b9',
	'#b3f6c0',
	'#fce094',
	'#a6dbff',
	'#ffcaff',
	'#8cf8f7',
	'#eef1f8'
      },
      brights = {
        '#4f5258',
	'#ffc0b9',
	'#b3f6c0',
	'#fce094',
	'#a6dbff',
	'#ffcaff',
	'#8cf8f7',
	'#eef1f8'
      }
    },

    -- Windows, Tabs & Panes --
    ---------------------------
    pane_focus_follows_mouse = true,
    adjust_window_size_when_changing_font_size = false,
    mouse_wheel_scrolls_tabs = false,
    prefer_to_spawn_tabs = true,

    -- Mouse bindings --
    --------------------
    mouse_bindings = {
      -- Scrolling --
      ---------------
      -- [ mouse wheel up ] -> scroll up the terminal view.
      { event = { Down = { streak = 1, button = { WheelUp = 1 } } }, mods = 'NONE', action = wezterm.action.ScrollByCurrentEventWheelDelta },

      -- [ mouse wheel down ] -> scroll down the terminal view.
      { event = { Down = { streak = 1, button = { WheelDown = 1 } } }, mods = 'NONE', action = wezterm.action.ScrollByCurrentEventWheelDelta },

      -- Paste --
      -----------
      -- [ middle-click ] -> paste from clipboard.
      { event = { Down = { streak = 1, button = 'Middle' } }, mods = 'NONE', action = wezterm.action.PasteFrom 'Clipboard' },

      -- Text selection and copying --
      --------------------------------
      -- [ 3 x left-click + drag ] -> select and copy text by drawing rectangular blocks.
      { event = { Down = { streak = 3, button = 'Left' } }, mods = 'NONE', action = wezterm.action.SelectTextAtMouseCursor('Block') },
      { event = { Drag = { streak = 3, button = 'Left' } }, mods = 'NONE', action = wezterm.action.ExtendSelectionToMouseCursor('Block') },
      { event = { Up = { streak = 3, button = 'Left' } }, mods = 'NONE', action = wezterm.action.Multiple { wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'), wezterm.action.ClearSelection } },

      -- [ 2 x left-click + drag ] -> select and copy text word by word.
      { event = { Down = { streak = 2, button = 'Left' } }, mods = 'NONE', action = wezterm.action.SelectTextAtMouseCursor('Word') },
      { event = { Drag = { streak = 2, button = 'Left' } }, mods = 'NONE', action = wezterm.action.ExtendSelectionToMouseCursor('Word') },
      { event = { Up = { streak = 2, button = 'Left' } }, mods = 'NONE', action = wezterm.action.Multiple { wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'), wezterm.action.ClearSelection } },

      -- [ left-click + drag ] -> select and copy text following the cursor.
      { event = { Down = { streak = 1, button = 'Left' } }, mods = 'NONE', action = wezterm.action.SelectTextAtMouseCursor('Cell') },
      { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'NONE', action = wezterm.action.ExtendSelectionToMouseCursor('Cell') },
      { event = { Up = { streak = 1, button = 'Left' } }, mods = 'NONE', action = wezterm.action.Multiple { wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'), wezterm.action.ClearSelection } },

      -- Opening URLs --
      ------------------
      -- [ modifierKey + left-click ] -> open URL under cursor.
      { event = { Down = { streak = 1, button = 'Left' } }, mods = modifierKey, action = wezterm.action.OpenLinkAtMouseCursor }

    },

    -- Keybindings --
    -----------------
    keys = {
      -- Overlays --
      --------------
      -- [ modifierKey + d ] -> show debug overlay.
      { key = 'd', mods = modifierKey, action = wezterm.action.ShowDebugOverlay },

      -- [ modifierKey + p ] -> show command palette.
      { key = 'p', mods = modifierKey, action = wezterm.action.ActivateCommandPalette },

      -- [ modifierKey + f ] -> show search overlay.
      { key = 'f', mods = modifierKey, action = wezterm.action.Search('CurrentSelectionOrEmptyString') },

      -- Tab/pane management --
      -------------------------
      -- [ modifierKey + h ] -> create a split to the left.
      { key = 'h', mods = modifierKey, action = wezterm.action.SplitPane { direction = 'Left' } },

      -- [ modifierKey + j ] -> create a split below.
      { key = 'j', mods = modifierKey, action = wezterm.action.SplitPane { direction = 'Down' } },

      -- [ modifierKey + k ] -> create a split above.
      { key = 'k', mods = modifierKey, action = wezterm.action.SplitPane { direction = 'Up' } },

      -- [ modifierKey + l ] -> create a split to the right.
      { key = 'l', mods = modifierKey, action = wezterm.action.SplitPane { direction = 'Right' } },

      -- [ modifierKey + z ] -> toggle pane zoom.
      { key = 'z', mods = modifierKey, action = wezterm.action.TogglePaneZoomState },

      -- [ modifierKey + right-arrow ] -> expand current pane towards the right.
      { key = 'RightArrow', mods = modifierKey, action = wezterm.action.AdjustPaneSize { 'Right', 1 } },

      -- [ modifierKey + left-arrow ] -> expand current pane towards the left.
      { key = 'LeftArrow', mods = modifierKey, action = wezterm.action.AdjustPaneSize { 'Left', 1 } },

      -- [ modifierKey + up-arrow ] -> expand current pane towards the top.
      { key = 'UpArrow', mods = modifierKey, action = wezterm.action.AdjustPaneSize { 'Up', 1 } },

      -- [ modifierKey + down-arrow ] -> expand current pane towards the bottom.
      { key = 'DownArrow', mods = modifierKey, action = wezterm.action.AdjustPaneSize { 'Down', 1 } },

      -- [ modifierKey + t ] -> create a new tab.
      { key = 't', mods = modifierKey, action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

      -- [ modifierKey + . ] -> move the current tab to the left.
      { key = '<', mods = modifierKey, action = wezterm.action.MoveTabRelative(-1) },

      -- [ modifierKey + , ] -> move the current tab to the right.
      { key = '>', mods = modifierKey, action = wezterm.action.MoveTabRelative(1) },

      -- [ modifierKey + w ] -> close the current pane, tab and window, in that order.
      { key = 'w', mods = modifierKey, action = wezterm.action.CloseCurrentPane { confirm = false } },

      -- [ modifierKey + return ] -> rename current tab.
      {
        key = 'Enter',
        mods = modifierKey,
        action = wezterm.action.PromptInputLine {
          description = 'Enter a new name for the current tab',
          action = wezterm.action_callback(
            function(window, pane, tabNewName)
              if ( tabNewName ~= nil ) then
                window:active_tab():set_title(tabNewName)
              end
            end
          )
        }
      },

      -- Tab/pane navigation --
      --------------------
      -- [ modifierKey + n ] -> go to the next tab.
      { key = 'n', mods = modifierKey, action = wezterm.action.ActivateTabRelative(1) },

      -- [ modifierKey + b ] -> go to the previous tab.
      { key = 'b', mods = modifierKey , action = wezterm.action.ActivateTabRelative(-1) },

      -- Copy & paste --
      ------------------
      -- [ modifierKey + c ] -> copy selection to clipboard and primary selection buffer.
      { key = 'c', mods = modifierKey, action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },

      -- [ modifierKey + v ] -> paste from clipboard.
      { key = 'v', mods = modifierKey, action = wezterm.action.PasteFrom 'Clipboard' },

      -- Adjust font size --
      ----------------------
      -- [ modifierKey + = ] -> increase font size.
      { key = '+', mods = modifierKey, action = wezterm.action.IncreaseFontSize },

      -- [ modifierKey + - ] -> decrease font size.
      { key = '_', mods = modifierKey, action = wezterm.action.DecreaseFontSize },

      -- [ modifierKey + 0 ] -> reset font size.
      { key = ')', mods = modifierKey, action = wezterm.action.ResetFontSize },

      -- Scrollback --
      ----------------
      -- [ modifierKey + backspace ] -> clear scrollback and viewport, then redraw the prompt.
      { key = 'Backspace', mods = modifierKey, action = wezterm.action.Multiple { wezterm.action.ClearScrollback 'ScrollbackAndViewport', wezterm.action.SendKey { key = 'L', mods = 'CTRL' } } }

    }

  }

  -- Export the above defined 'config' table.
  return config

end
