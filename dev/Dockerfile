FROM kuzzleio/test
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-256color SHELL=/bin/zsh

RUN apt-get update && apt-get install -y \
      bash-completion \
      dnsutils \
      mosquitto-clients \
      netcat \
      nmap \
      vim \
      zsh && \
    npm install -g \
      node-inspector && \
    apt-get clean

RUN chsh -s /bin/zsh && \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzle%(?,%{$fg[green]%},%{$fg[red]%}) # "' >> ~/.zshrc
ADD profile /tmp/profile
RUN bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/'

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall >/dev/null

CMD ["/run.sh"]
