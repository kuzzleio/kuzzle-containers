FROM debian:jessie
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-256color SHELL=/bin/zsh

RUN apt-get update && apt-get install -y \
    amqp-tools \
    bash-completion \
    build-essential \
    curl \
    dnsutils \
    g++ \
    git \
    mosquitto-clients \
    netcat \
    nmap \
    python \
    vim \
    wget \
    zsh && \
    apt-get clean

ENV NODE_VERSION=4.2.1

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /root/
RUN tar xvf /root/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ && \
    rm /root/node-v$NODE_VERSION-linux-x64.tar.gz

ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

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

RUN mkdir -p /var/app

WORKDIR /var/app
CMD ["zsh"]
