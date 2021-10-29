# Created by newuser for 5.8
alias delete="yay -Qqe | fzf -m  --reverse --preview 'yay -Si {1}' | xargs -ro yay -R"
alias addpkg="yay -Slq | fzf -m  --reverse --preview 'yay -Si {1}' | xargs -ro yay -S --noconfirm"

alias zshrc="nano .zshrc"
alias sudo="sudo -E"
alias config="nano .config/sway/config"
