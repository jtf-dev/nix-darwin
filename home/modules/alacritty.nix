{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        # Use window manager's recommended size
        dimensions = {
          columns = 0;
          lines = 0;
        };

        padding = {
          x = 6;
          y = 4;
        };

        # Spread additional padding evenly around the terminal content.
        dynamic_padding = true;

        # Allow terminal applications to change Alacritty's window title.
        dynamic_title = true;
      };

      scrolling = {
        multiplier = 3;
      };

      # Font configuration
      font = {
        # Normal (roman) font face
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };

        # Bold font face
        bold = {
          family = "MesloLGS NF";

          # The `style` can be specified to pick a specific face.
          style = "Bold";
        };

        # Italic font face
        italic = {
          family = "MesloLGS NF";
          style = "Italic";
        };

        # Point size
        size = 14.0;

        offset = {
          y = 3; # increase line height
        };
      };

      # Colors (Gruvbox dark)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '0x1d2021'
          background = "0x282828";
          # soft contrast: background = '0x32302f'
          foreground = "0xebdbb2";
        };

        # Normal colors
        normal = {
          black =   "0x282828";
          red =     "0xcc241d";
          green =   "0x98971a";
          yellow =  "0xd79921";
          blue =    "0x458588";
          magenta = "0xb16286";
          cyan =    "0x689d6a";
          white =   "0xa89984";
        };

        # Bright colors
        bright = {
          black =   "0x928374";
          red =     "0xfb4934";
          green =   "0xb8bb26";
          yellow =  "0xfabd2f";
          blue =    "0x83a598";
          magenta = "0xd3869b";
          cyan =    "0x8ec07c";
          white =   "0xebdbb2";
        };
      };

      # Bell
      bell = {
        animation = "EaseOutExpo";
        duration = 100;
        color = "#999999";
      };

      # Regex hints
      #
      # Terminal hints can be used to find text in the visible part of the terminal
      # and pipe it to other applications.
      hints = {
        # Keys used for the hint labels.
        #alphabet: "jfkdls;ahgurieowpq"

        # List with all available hints
        #
        # Each hint must have a `regex` and either an `action` or a `command` field.
        # The fields `mouse`, `binding` and `post_processing` are optional.
        #
        # The fields `command`, `binding.key`, `binding.mods`, `binding.mode` and
        # `mouse.mods` accept the same values as they do in the `key_bindings` section.
        #
        # The `mouse.enabled` field controls if the hint should be underlined while
        # the mouse with all `mouse.mods` keys held or the vi mode cursor is above it.
        #
        # If the `post_processing` field is set to `true`, heuristics will be used to
        # shorten the match if there are characters likely not to be part of the hint
        # (e.g. a trailing `.`). This is most useful for URIs.
        #
        # Values for `action`:
        #   - Copy
        #       Copy the hint's text to the clipboard.
        #   - Paste
        #       Paste the hint's text to the terminal or search.
        #   - Select
        #       Select the hint's text.
        #   - MoveViModeCursor
        #       Move the vi mode cursor to the beginning of the hint.
        enabled = [
          {
            regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";
            command = "open";
            post_processing = true;
            mouse = {
              enabled = true;
              mods = "None";
            };
            binding = {
              key = "U";
              mods = "Control|Shift";
            };
          }
        ];
      };

      # Mouse bindings
      #
      # Available fields:
      #   - mouse
      #   - action
      #   - mods (optional)
      #
      # Values for `mouse`:
      #   - Middle
      #   - Left
      #   - Right
      #   - Numeric identifier such as `5`
      #
      # All available `mods` and `action` values are documented in the key binding
      # section.

      mouse = {
        # Click settings
        #
        # The `double_click` and `triple_click` settings control the time
        # alacritty should wait for accepting multiple clicks as one double
        # or triple click.

        # If this is `true`, the cursor is temporarily hidden when typing.
        hide_when_typing = true;
      };

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";

        # When set to `true`, selected text will be copied to the primary clipboard.
        save_to_clipboard = false;
      };

      cursor = {
        # Cursor style
        #
        # Values for `style`:
        #   - ▇ Block
        #   - _ Underline
        #   - | Beam
        style = "Beam";

        # If this is `true`, the cursor will be rendered as a hollow box when the
        # window is not focused.
        unfocused_hollow = true;
      };

      # Shell
      #
      # You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
      # Entries in `shell.args` are passed unmodified as arguments to the shell.
      #
      # Default:
      #   - (macOS) /bin/bash --login
      #   - (Linux) user login shell
      #   - (Windows) powershell
      # terminal.shell = {
      #   program = "zsh";
      #   args = [
      #     "--login"
      #     "-c"
      #     "tmux -u new-session -A -s 0-main"
      #   ];
      # };

      # Key bindings
      #
      # Key bindings are specified as a list of objects. Each binding will specify a
      # key and modifiers required to trigger it, terminal modes where the binding is
      # applicable, and what should be done when the key binding fires. It can either
      # send a byte sequence to the running application (`chars`), execute a
      # predefined action (`action`) or fork and execute a specified command plus
      # arguments (`command`).
      #
      # Bindings are always filled by default, but will be replaced when a new binding
      # with the same triggers is defined. To unset a default binding, it can be
      # mapped to the `None` action.
      #
      # Example:
      #   `- { key: V, mods: Control|Shift, action: Paste }`
      #
      # Available fields:
      #   - key
      #   - mods (optional)
      #   - chars | action | command (exactly one required)
      #   - mode (optional)
      #
      # Values for `key`:
      #   - `A` -> `Z`
      #   - `F1` -> `F12`
      #   - `Key1` -> `Key0`
      #
      #   A full list with available key codes can be found here:
      #   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
      #
      #   Instead of using the name of the keys, the `key` field also supports using
      #   the scancode of the desired key. Scancodes have to be specified as a
      #   decimal number.
      #   This command will allow you to display the hex scancodes for certain keys:
      #     `showkey --scancodes`
      #
      # Values for `mods`:
      #   - Command
      #   - Control
      #   - Option
      #   - Super
      #   - Shift
      #   - Alt
      #
      #   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
      #   Whitespace and capitalization is relevant and must match the example.
      #
      # Values for `chars`:
      #   The `chars` field writes the specified string to the terminal. This makes
      #   it possible to pass escape sequences.
      #   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
      #   the command `showkey -a` outside of tmux.
      #   Note that applications use terminfo to map escape sequences back to
      #   keys. It is therefore required to update the terminfo when
      #   changing an escape sequence.
      #
      # Values for `action`:
      #   - Paste
      #   - PasteSelection
      #   - Copy
      #   - IncreaseFontSize
      #   - DecreaseFontSize
      #   - ResetFontSize
      #   - ScrollPageUp
      #   - ScrollPageDown
      #   - ScrollLineUp
      #   - ScrollLineDown
      #   - ScrollToTop
      #   - ScrollToBottom
      #   - ClearHistory
      #   - Hide
      #   - Quit
      #   - ClearLogNotice
      #   - SpawnNewInstance
      #   - ToggleFullscreen
      #   - None
      #
      # Values for `action` (macOS only):
      #   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
      #
      # Values for `command`:
      #   The `command` field must be a map containing a `program` string and
      #   an `args` array of command line parameter strings.
      #
      #   Example:
      #       `command: { program: "alacritty", args: ["-e", "vttest"] }`
      #
      # Values for `mode`:
      #   - ~AppCursor
      #   - AppCursor
      #   - ~AppKeypad
      #   - AppKeypad
    };
  };
}
