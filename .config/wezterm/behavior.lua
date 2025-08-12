local wezterm = require("wezterm") --[[@as Wezterm]]

return {
    hyperlink_rules = wezterm.default_hyperlink_rules(),
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    -- default_prog = {
    -- "zsh", "-c",
    -- '/opt/homebrew/bin/tmux attach',
    -- "/opt/homebrew/bin/tmux",
    -- "-c",
    -- "--",
    -- "tmux new -As config",
    -- },
    -- exit_behavior = "Hold", -- optional: keep tab open on
    -- term = "wezterm", -- Enables proper rendering for italics & bold in Neovim
}
