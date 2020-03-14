FROM codercom/code-server
RUN \
# Install packages
    apt-get update; \
    apt-get install -y \
    # generic build
        build-essential \
        libssl-dev \
        libffi-dev \
        git \
    # python3
        python3 \
        python3-dev \
        python3-pip \
        pipenv
# Setup environment
USER coder
RUN \
    # Pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv; \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc; \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc; \
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc; \
    exec "$SHELL"; \
    git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update; \
    pyenv update; \
    # Pipenv
    echo 'eval "$(pipenv --completion)"' >> ~/.bash_profile; \

  