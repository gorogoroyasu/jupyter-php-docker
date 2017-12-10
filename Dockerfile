FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y &&\
  apt-get install git vim  build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libbz2-dev libreadline-dev build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libbz2-dev libreadline-dev git vim  curl wget zip unzip locales software-properties-common python-software-properties  -y  &&\
  apt-get update -y &&\
  bin/bash -c "mkdir /root/.pyenv"

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
ENV HOME  /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv install 3.6.3
RUN pyenv global 3.6.3
RUN python -V
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

RUN  pip install jupyter &&\
  wget https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar &&\
  locale-gen en_US.UTF-8 &&\
  export LANG=en_US.UTF-8 &&\
  add-apt-repository ppa:ondrej/php -y &&\
  apt-get update -y &&\
  apt-get install php7.1 -y &&\
  curl -sS https://getcomposer.org/installer | php &&\
  mv composer.phar /usr/local/bin/composer &&\
  composer require psy/psysh &&\
  apt-get install php-zmq -y &&\
  php jupyter-php-installer.phar install -vv
EXPOSE 80
ENV DEBIAN_FRONTEND dialog
