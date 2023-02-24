# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export JAVA_HOME=/opt/taobao/java
export PATH=${JAVA_HOME}/bin:${PATH}

# origin pyenv settings
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="/usr/bin:/usr/local/bin:$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$PATH:/home/admin/.local/bin/
export PATH="/home/admin/.pyenv/shims:${PATH}"
export PYENV_SHELL=bash
source '/home/admin/.pyenv/libexec/../completions/pyenv.bash'
command pyenv rehash 2>/dev/null

function pyenv() {
    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
    rehash|shell)
        eval "$(pyenv "sh-$command" "$@")";;
    *)
        command pyenv "$command" "$@";;
    esac
}

# export LC_ALL=C.UTF-8
# export LANG=C.UTF-8

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pyenv install python with taobao source
# you can use like: pyinstall 3.9.10
function pyinstall() {
    v=$1
    echo "Installing Python" $v
    cache_dir="$HOME/.pyenv/cache"
    echo "Cache dir: $cache_dir"
    if [ ! -d $cache_dir ]; then
        echo "Creating cache dir: $cache_dir"
        mkdir -p $cache_dir
    fi
    curl -L https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -o $cache_dir/Python-$v.tar.xz
    pyenv install $v
}

alias pylint="yapf --style .style.yapf --recursive --parallel -i "
alias proxyon="export http_proxy='http://127.0.0.1:9000'; export https_proxy='http://127.0.0.1:9000'"
alias proxyoff="unset http_proxy; unset https_proxy"
export no_proxy="localhost,127.0.0.1,::1,raylet.cn-hangzhou-alipay-b.oss-cdn.aliyun-inc.com,alipay-kepler-resource.cn-hangzhou.alipay.aliyun-inc.com,mirrors.aliyun.com,mvn.dev.alipay.net,code.alipay.com"

# history size
HISTSIZE=50000

export TERM=xterm-256color

#set git branch
red=$'\e[1;31m'
green=$'\e[1;32m'
yellow=$'\e[1;33m'
blue=$'\e[0;34m'
magenta=$'\e[1;35m'
cran=$'\e[0;36m'
normal_colours=$'\e[m'


function find_git_branch {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch=" ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=' (detached)'
            else
                git_branch=' (unknown)'
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
PS1="\[$green\]\u@\[$magenta\]\H:\[$yellow\]\w\[$red\]\$git_branch\[$green\]\\[$normal_colours\] [\\t]\\n\$ "

alias rm="$HOME/buhe/tools/util/remove.sh"
