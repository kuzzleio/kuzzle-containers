FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

COPY profile /tmp/profile

WORKDIR /var/app

RUN apt-get update && apt-get install -y \
      build-essential \
      g++ \
      python \
      libfontconfig \
      bash-completion \
      vim \
      rbenv \
      curl \
      git \
      wget \
      zsh \
    && gem install \
      sass --version 3.2.10 \
    && npm install -g \
      bower \
      node-inspector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV TERM=xterm-256color \
    SHELL=/bin/zsh

RUN chsh -s /bin/zsh && \
    curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzle%(?,%{$fg[green]%},%{$fg[red]%}) # "' >> ~/.zshrc && \
    bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/' && \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall >/dev/null
