FROM kuzzleio/bo-test:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

ADD profile /tmp/profile

RUN set -ex && \
    apk add -U \
        bash \
        build-base \
        python \
        vim \
        zsh && \
    zsh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzle%(?,%{$fg[green]%},%{$fg[red]%}) # %{$reset_color%}"' >> ~/.zshrc && \
    bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/' && \
    cat /root/.bashrc >> /etc/profile && \
    npm install -g \
        node-inspector@0.12.3 && \
    echo "done"


ADD scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["/run-dev.sh"]
