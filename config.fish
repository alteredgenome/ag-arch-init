if status is-interactive
set -g theme_display_user yes
set -g theme_display_hostname yes
alias hi="yay -S"
alias bye="yay -Rn"
alias about="neofetch --ascii_distro arch_old"
alias upgradesys="sudo pacman -Syu"
alias upgrademirrors="sudo reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist"
alias music="~/.scripts/music.sh"
alias cleanup="~/.scripts/cleanup.sh"
alias health="s-tui"
alias execute="echo &&"
alias burn="~/.scripts/burn.sh"
# Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

