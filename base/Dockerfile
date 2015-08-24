FROM debian:wheezy
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-256color SHELL=/bin/zsh

RUN apt-get update && apt-get install -y \
    bash-completion \
    curl \
    dnsutils \
    git \
    netcat \
    vim \
    python \
    build-essential \
    g++ \
    nmap \
    zsh && \
    apt-get clean

ENV NODE_VERSION 0.12.7

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /root/
RUN tar xvf /root/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ && \
    rm /root/node-v$NODE_VERSION-linux-x64.tar.gz && \
    ln -s /opt/node-v$NODE_VERSION-linux-x64/bin/* /usr/local/bin/
RUN npm install -g pm2

RUN chsh -s /bin/zsh && \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="kardan"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc
ADD profile /tmp/profile
RUN bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/'

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall >/dev/null

RUN mkdir -p /var/app

WORKDIR /var/app
CMD ["zsh"]

