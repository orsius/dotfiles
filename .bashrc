# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#################################################################################
## # User specific aliases and functions
#################################################################################
## to change your default shell run the following
# chsh -s /bin/sh

# ## FUNCTIONS
#################################################
function echo_and_run {
  echo "$" "$@"
  eval $(printf '%q ' "$@") < /dev/tty
}
alias ear='echo_and_run'


PS1='\[\e[1;32m\][\u]@\[\e[1;37m\]\h \W]\$\[\e[0m\] '

# say -v Daniel "who is the boss?"

# zip -r -X archive_name.zip folder_to_compress
# tar --extract --file={tarball.tar} {file}

## # PATH
# ## mongodb
export PATH=/Users/gfranchini/Workspace/mongoUniv/mongodb/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# ## Add my own script
export PATH=/Users/gfranchini/bin:$PATH

# ## virtualenv setup
# virtualenv -p /usr/bin/python2.7 venv
# source venv/bin/activate
# pip install requests
# deactivate

# ## Jupyter notebook
# cd /Users/gfranchini/Workspace/JupyterNotebook; source venv/bin/activate ; jupyter notebook

# convert byte to human readable format
# printf %s\\n 559868908 | numfmt --to=iec-i

## # downl -r recur -l (depth level) -A "type"
# wget http://www.mon.url/listefichier.html -r -l 1 -A pdf
# wget -c -i liste-url.txt

# vim -- delete the first 5character of a line:
# :%s/^.\{0,5\}//

# ss -lntp | grep 6379

#################################################
# ## ALIASES 
#################################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias lr='ls -R'                    # recursive ls
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | less'

alias drygrep='grep -Ev "(^$|#)"'
alias prettyjson='python -m json.tool'

alias ipen0='ipconfig getifaddr en0' # for wireless
alias ipen1='ipconfig getifaddr en1' # for ethernet
alias mymacaddr="ifconfig en0 | grep ether | awk '{ print $2 }'"

# how2 hunt down disk space
alias ducks='du -cks * | sort -rn | head'
alias ducks2='du -hsx * | sort -rn | head -10'
#alias ducks3="find . -type f -size +100000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'"

# mac os x updatedb
alias updatedb='sudo /usr/libexec/locate.updatedb'
# list|info mounted volumes
# diskutil list # diskutil info /dev/desk4s1

# VBoxManage
# VBoxManage startvm "VM name" --type headless
# VBoxManage controlvm "VM name" (poweroff|pause|reset|savestate)
# for i in $(vbm list runningvms | awk '{ print $1 }' | sed 's/"//g'); do echo $i; vbm controlvm ${i} savestate; done
alias vbm='VBoxManage'

# ansible -- alias
# ansible-playbook -i "localhost," -c local helloworld.yml
# ansible-doc -l # ansible-doc yum
# ansible webservers -m git -a "repo=git://foo.example.org/repo.git dest=/srv/myapp version=HEAD"
# ansible all -m setup

# elasticsearch aliases
alias pselastic='ps -ef | grep [e]lasticsearch'
alias pslogstash='ps -ef | grep [l]ogstash'
alias pskibana='ps -ef | grep [k]ibana'

# git
alias gitaddmodify='git ls-files --modified | xargs git add'

# k8s
source <(kubectl completion bash) # setup autocomplete in bash, bash-completion package should be installed first.

# grafana
# brew update && brew reinstall grafana
# brew tap homebrew/services      # make sure homebrew/services is installed.
# brew services (start|stop) grafana



#################################################
# ## ALIASES END
#################################################

# pass a file a as input to a logstash conf
# cat farequote.csv | ./logstash -f farequote.conf

# generate a hash of 12 character
#date +%s | shasum5.16 | base64 | head -c 12 | awk '{print toupper($0)}'

# go -- prog language
export GOBIN="$HOME/Workspace/go/bin"
export GOPATH="$HOME/Workspace/go/src"
export GOROOT=/usr/local/go

# ELK -- alias
FILEBEAT_HOME=/Users/gfranchini/Workspace/filebeat-1.3.0-darwin
alias filebeatstart='sudo ${FILEBEAT_HOME}/filebeat -e -c ${FILEBEAT_HOME}/filebeat.yml -d "publish"'
alias rabbitmqstart='/Users/gfranchini/Workspace/rabbitmq_server-3.6.5/sbin/rabbitmq-server -detached'

# AWS -- alias
# $ ssh -v -i /pathto/[certfilename].pem ec2-user@[ec2hostname]
alias ssh-aws-es1='ssh -v -i ~/.aws_ssh/aws-es-sshkeypair.pem ec2-user@ec2-54-152-134-96.compute-1.amazonaws.com'
alias ssh-aws-es2='ssh -v -i ~/.aws_ssh/aws-es-sshkeypair.pem ec2-user@ec2-54-88-69-62.compute-1.amazonaws.com'
alias ssh-aws-es3='ssh -v -i ~/.aws_ssh/aws-es-sshkeypair.pem ec2-user@ec2-54-84-19-203.compute-1.amazonaws.com'

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# create a python3 virtualenv
#virtualenv -p python3 ${ENV_DIR}
#source ${ENV_DIR}/bin/activate

# docker -- alias
# docker-compose up
# docker run -t -i elasticsearch /bin/bash
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'


# stream2es
#  ./stream2es wiki --target http://elastic:changeme@localhost:9200/tmp  --log debug

# got a bash history with timestamp
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# rot13 encryption
## echo 'fooman@example.com' | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
## echo 'fooman@example.com' | rot13

# ruby
# ruby -e 'p "0110111101110000011001010110111000100000011100110110111101110101011100100110001101100101".scan(/.{8}/).map { |i| i.to_i(2).chr }.join'


