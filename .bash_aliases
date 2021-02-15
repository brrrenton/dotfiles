# ls aliases
alias l='ls -CF1'
alias ll='ls -lh'

# Directory changing for Midnight Commander
alias mc='source /usr/share/mc/bin/mc-wrapper.sh'

# Human readable sizes for df
alias df='df -h'

# Neovim
if [ `which nvim` ]; then alias vim=nvim; fi

# Git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gmv='git mv'
alias gpll='git pull'
alias gpsh='git push'
alias gs='git status'

# ROS
alias catkin_make='catkin_make_isolated --use-ninja -DCMAKE_BUILD_TYPE=Release'
alias catkin_make_isolated='catkin_make_isolated --use-ninja -DCMAKE_BUILD_TYPE=Release'

## Echo any not OK diagnostic status messages
alias refd='rostopic echo --filter="[True for s in m.status if s.level >= 1]" /diagnostics'

# PlatformIO
alias pdm='pio device monitor'
alias pru='pio run -t upload'

## With a port
alias pdmp='pio device monitor -p'
alias prup='pio run -t upload --upload-port'

