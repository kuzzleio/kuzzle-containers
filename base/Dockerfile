FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-color

RUN apk add -U \
    bash \
    bzip2 \
    curl \
    git \
    nodejs \
    tar \
    vim \
    zsh

ADD profile /tmp/profile
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzle%(?,%{$fg[green]%},%{$fg[red]%}) # %{$reset_color%}"' >> ~/.zshrc && \
    bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/' && \
    cat /root/.bashrc >> /etc/profile

RUN mkdir -p /var/app

WORKDIR /var/app

CMD ["zsh"]
