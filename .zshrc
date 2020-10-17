source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh 
tmux source ~/.tmux.conf
PATH="/usr/local/opt/sqlite/bin:$PATH"
eval "$(fnm env --multi)"
eval "chruby 2.6.5"
. $(brew --prefix asdf)/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
eval "$(direnv hook zsh)"

alias badabing='source ~/.zshrc'
alias gitswap='git checkout $(git branch --sort=-committerdate | fzy)'
alias gitnuke='git reset --hard'
alias grbim='git rebase -i origin/master'
alias grbc='git rebase --continue'
alias grbca='git add . && grbc'
alias grba='git rebase --abort'
alias gitfix='git add . && git commit --amend --no-edit'
alias gitundo='git reset HEAD~1'
alias gitpop='git stash pop'
alias gittuck='git add . && git stash -u'
alias gittucktest='git add . && git stash -k -u'
alias gc='git checkout'
alias gcb='gc -b'
alias gp='git pull'
alias gf='git fetch'
alias gitpf='git push --force-with-lease origin $(git branch --show-current)'
alias diditbreak='bundle exec rspec $(find spec -type f | fzy)'
alias find_route='rake routes | fzy'
alias find_task='rake -T | fzy'
alias twobirds='teamocil onefeather'
alias smartball='teamocil smartballot'
alias bikefast='teamocil cantstandstill'
alias deaddove='tmux kill-session -t onefeather'
alias bikecrash='tmux kill-session -t cantstandstill'
alias leaky="pkill -9 -f 'rb-fsevent|rails|puma|node'"
alias bxr="bundle exec"
alias test="bundle exec rspec --only-failures "
alias test_all="bundle exec rspec"
alias br="./bin/rails"
alias shortcuts="nano ~/.zshrc && badabing"
alias secretsauce="EDITOR="nano" bin/rails credentials:edit"
#alias test_changed="eval \"test --format progress --format documentation --out changed_tests.txt $(echo \"$(tr \"\n\" \" \" <<< \"$(git diff --name-only master HEAD | grep spec)\")\")\""
alias branch_test_changes="git diff --name-only master HEAD | grep spec"
alias stash_smash="gitpop && gitfix"
alias fix_next="--next-failure"

function killer() {
  kill -9 $(ps aux | fzy | gawk '{print$2}')
}

function onefeather_staging() {
  heroku run $1 --app onefeather-staging
}

function onefeather_staging_console() {
  heroku run "./bin/rails c" --app onefeather-staging
}

function onefeather_prod() {
  heroku run $1 --app onefeather
}