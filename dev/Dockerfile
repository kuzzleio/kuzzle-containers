FROM kuzzleio/base:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

ADD profile /tmp/profile

RUN set -ex && \
    apk add -U \
        bash \
        build-base \
        git \
        python \
        vim \
        zsh && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzle%(?,%{$fg[green]%},%{$fg[red]%}) # %{$reset_color%}"' >> ~/.zshrc && \
    bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/' && \
    cat /root/.bashrc >> /etc/profile && \
    npm install -g \
        node-inspector@0.12.3 && \
    apk del \
        build-base \
        python


ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["/run-debug.sh"]
