
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

alias vim='nvim'
alias vi='nvim'

### Added by Zplugin's installer
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin light supercrabtree/k
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

zplugin light zdharma/zui
zplugin light zdharma/zplugin-crasis

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT='%F{242}%* '$PROMPT
