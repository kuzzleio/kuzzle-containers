FROM kuzzleio/proxy-test:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

ADD profile /tmp/profile

RUN set -ex && \
    apk update && \
    apk add -U \
        bash \
        vim \
        zsh \
        ca-certificates \
        wget && \
    update-ca-certificates && \
    zsh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true && \
    sed -ri 's|ZSH_THEME="[^"]+"|ZSH_THEME="terminalparty"|' ~/.zshrc && \
    echo "export EDITOR=vim" >> ~/.zshrc && \
    echo 'bindkey "\033[1~" beginning-of-line' >> ~/.zshrc && \
    echo 'bindkey "\033[4~" end-of-line' >> ~/.zshrc && \
    echo 'export PROMPT="%{$fg[green]%}kuzzleLB%(?,%{$fg[green]%},%{$fg[red]%}) # %{$reset_color%}"' >> ~/.zshrc && \
    bash -c 'shopt -s dotglob; mv /tmp/profile/* /root/' && \
    cat /root/.bashrc >> /etc/profile && \
    npm install -g \
        node-inspector@0.12.3 && \
    echo "done"
    
ENV PATH=/var/app/bin:$PATH
ADD /config/ /config/
ENV TERM=xterm-color

CMD ["/run-debug.sh"]
