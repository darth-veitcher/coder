ARG PYTHON_MAJOR_VERSION=3
FROM codercom/code-server
USER root
RUN \
# Install packages
    apt-get update; \
    apt-get install -y \
    # generic build
        make \
        build-essential \
        git \
    # optional useful
        nano \
    # python3
        python3 \
        python3-dev \
        python3-pip \
        # pyenv
        libssl-dev \
        libffi-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        liblzma-dev \
        python-openssl \
    ; \
    # pipenv
    curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python3
# Setup environment
USER coder
RUN \
    # Pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv; \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc; \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc; \
    bash -c "echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval \"\$(pyenv init -)\"\nfi' | tee -a ~/.bashrc"; \
    exec "$SHELL"; \
    git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update; \
    pyenv update; \
    export PYENV_PYTHON=$(pyenv install --list | grep -Eo '^\s*'${PYTHON_MAJOR_VERSION}'\.[0-9]*\.[0-9]*$' | sort -hr | head -n 1); \
    pyenv install $PYENV_PYTHON; \
    pyenv global $PYENV_PYTHON; \
    # Pipenv
    echo 'eval "$(pipenv --completion)"' >> ~/.bashrc; \
    # Docker: Ensure can access docker without needing sudo
    echo 'sudo chown coder:coder /var/run/docker.sock' >> ~/.bashrc; \
    # Git: store credentials for ease (could use 'cache timeout=3600' for one hour)
    git config --global credential.helper store
