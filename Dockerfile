FROM ruby:2.6.2

RUN mkdir /app
RUN gem install bundler

# Install NodeJS based on https://github.com/nodesource/distributions#installation-instructions
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash # Installs the node repository
RUN apt-get install --yes nodejs # Actually install NODEJS

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -y yarn

WORKDIR /app
ENV BUNDLE_PATH /gems

ENTRYPOINT ["./docker-entrypoint.sh"]
