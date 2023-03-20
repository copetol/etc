function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)
    set -l usercolor (set_color $fish_color_user; set_color -b $fish_color_user_bg)
    set -l separuser (set_color $fish_color_user_bg)
    set -l remotecolor (set_color $fish_color_host_remote;set_color -b $fish_color_host_remote_bg)

    set -l delim ⦒ # \U2A7A # ➿ # ➽  # ➺ # ⧚ # ⦔ # ᛟ # \U22CA # ∽ ≋ ∀ #  #\U1433
    # If we don't have unicode use a simpler delimiter
    string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL; or set delim ">"

    fish_is_root_user; and set delim "#"

    set -l cwd (set_color $fish_color_cwd;set_color -b $fish_color_cwd_bg)
    if command -sq cksum
        # randomized cwd color
        # We hash the physical PWD and turn that into a color. That means directories (usually) get different colors,
        # but every directory always gets the same color. It's deterministic.
        # We use cksum because 1. it's fast, 2. it's in POSIX, so it should be available everywhere.
        set -l shas (pwd -P | cksum | string split -f1 ' ' | math --base=hex | string sub -s 3 | string pad -c 0 -w 6 | string match -ra ..)
        set -l col 0x$shas[1..3]

        # If the (simplified idea of) luminance is below 120 (out of 255), add some more.
        # (this runs at most twice because we add 60)
        while test (math 0.2126 x $col[1] + 0.7152 x $col[2] + 0.0722 x $col[3]) -lt 120
            set col[1] (math --base=hex "min(255, $col[1] + 60)")
            set col[2] (math --base=hex "min(255, $col[2] + 60)")
            set col[3] (math --base=hex "min(255, $col[3] + 60)")
        end
        set -l col (string replace 0x '' $col | string pad -c 0 -w 2 | string join "")

        set cwd (set_color $col;set_color -b $fish_color_cwd_bg)
    end

    # Prompt status only if it's not 0
    set -l prompt_status
    #test $last_status -ne 0; and set prompt_status (set_color $fish_color_error)"{$last_status}$normal"
    test $last_status -ne 0; and set prompt_status (set_color $fish_color_error)" •"

    # Only show host if in SSH or container
    # Store this in a global variable because it's slow and unchanging
    if not set -q prompt_host
        set -g prompt_host ""
        if set -q SSH_TTY
            or begin
                command -sq systemd-detect-virt
                and systemd-detect-virt -q
            end
            set prompt_host $remotecolor $hostname (set_color $fish_color_host_remote_bg; set_color -b $fish_color_cwd_bg) 
            set -g separuserbg (set_color -b $fish_color_host_remote_bg)
        end
    end

    if not set -q separuserbg
      set separuserbg (set_color -b $fish_color_cwd_bg)
    end

    # Shorten pwd if prompt is too long
    set -l pwd (prompt_pwd -d4)
    set -l separlast (set_color $fish_color_normal;set_color $fish_color_cwd_bg)

    echo -n -s $usercolor $USER $separuserbg $separuser $prompt_host $cwd $pwd $prompt_status $separlast $normal" "
end
