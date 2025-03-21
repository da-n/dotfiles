alias vim='nvim'
alias t='tmux'
alias k='kubectl'
alias p='pillar'
alias jg='make -j8 generate'
alias cdvim='cd ${HOME}/dotfiles/nvim/.config/nvim'
alias cdp='cd ${HOME}/code/pillar'
alias cdpm='cd ${HOME}/code/pillar/src/clients/mobile/adalpha_investor_app'
alias gogen='cd src; go generate -tags=generate ./...; cd -'
alias epll='eval `pillar login local.pillar`'
alias epld='eval `pillar login adalpha.dev`'
alias eplt='eval `pillar login adalpha.tech`'
alias eplp='eval `pillar login ajbelltouch.co.uk`'
alias eptv='eval `pillar tools vault`'
alias epts='eval `pillar tools sql` && printenv | grep PG'
alias eptsrw='eval `pillar tools sql -r dbmigrate`'
alias pts='pillar tools sql'
alias ptsenv='printenv | grep PG'
alias ptsmtp='pillar tools smtpui'
alias ptg='pillar tools grafana'
alias ptm='pillar tools messages'

# setup autocompletion
if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
else
  echo "Error loading git completions"
fi

sus() {
        user='super.user@local.pillar'
        req="{\"email\":\"$user\"}"
        res=$(pillar grpc GetTestUser $req)
        echo $user
        echo $res | jq .password
        echo $res | jq .totp_secret | tr -d '"' | { read value; pillar login totp $value; }
}

ud() {
        user=$1
        req="{\"email\":\"$user\"}"
        res=$(pillar grpc GetTestUser $req)
        echo $user
        echo $res | jq .password
        echo $res | jq .totp_secret | tr -d '"' | { read value; pillar login totp $value; }
}

