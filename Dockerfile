FROM ubuntu:14.04

RUN apt-get update
RUN sudo apt-get -y install \
    git \
    wget \
    curl \
    vim \
    gcc \
    g++ \
    libpq-dev \
    apt-transport-https

# for source
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# prompt styling
RUN wget https://gist.githubusercontent.com/dkoloditch/62f399d39f0443c16c98fadd7a71e5a1/raw/5802cbac879060c29efc6b198a63a9c6dffade71/.docker_prompt -P $HOME/ \
    && echo "" >> $HOME/.bashrc \
    && echo "source $HOME/.docker_prompt" >> $HOME/.bashrc \
    && echo "" >> $HOME/.bashrc \
    && source $HOME/.bashrc

# bash aliases
# RUN echo "alias myalias='cd ...'" >> $HOME/.bash_aliases \
#     && echo " " >> $HOME/.bashrc \
#     && echo "source $HOME/.bash_aliases" >> $HOME/.bashrc

# create mount directory
# RUN mkdir /dev

# Install NVM / Node & NPM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && source ~/.nvm/nvm.sh \
    && nvm install 8.2.0 \
    && nvm ls-remote > ~/node_versions.txt \
    && LATEST_NODE=$((tail -n1) < ~/node_versions.txt) \
    && nvm install $LATEST_NODE \
    && rm ~/node_versions.txt \
    && nvm alias latest $LATEST_NODE

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get update \
    && sudo apt-get -y install yarn

# Install RVM & Ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && \curl -sSL https://get.rvm.io | bash \
    && sudo touch /usr/local/rvm/scripts/version \
    && echo "" >> $HOME/.bashrc \
    && echo "source /etc/profile.d/rvm.sh" >> $HOME/.bashrc \
    && source /etc/profile.d/rvm.sh \
    && /bin/bash -l -c "rvm install 2.4.2" \
    && /bin/bash -l -c "rvm use 2.4.2" \
    && /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Elixir
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && sudo dpkg -i erlang-solutions_1.0_all.deb \
    && sudo apt-get -y update \
    && sudo apt-get -y install esl-erlang \
    && sudo apt-get -y install elixir
