FROM ubuntu:16.04
RUN apt-get -y update

# COMMON
RUN apt-get install -y curl vim software-properties-common

# RUBY 2.5
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get -y update
RUN apt-get install -y build-essential libxml2-dev libxslt1-dev libssl-dev zlib1g-dev nodejs
RUN apt-get install -y ruby2.5 ruby2.5-dev ruby-switch
RUN apt-get install -y sqlite3
RUN apt-get install libsqlite3-dev
# POSTGRESQL
RUN apt-get -y update
RUN apt-get install -y libpq-dev

# NODEJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# YARN
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update
RUN npm install -g yarn

# MOUNT PROJECT DIRECTORY
RUN mkdir -p /data/alac
WORKDIR /data/alac

# INSTALL BUNDLER GEM 
RUN gem install bundler -v 1.16.1

# INSTALL GEMFILE DEPENDENCIES
ADD /alac-dashboard/Gemfile /data/alac/Gemfile
ADD /alac-dashboard/Gemfile.lock /data/alac/Gemfile.lock
RUN bundle install

# ADD PROJECT FILES
ADD . /data/alac

#RUN rake db:create
#RUN rake db:migrate

COPY /alac-dashboard/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["./bin/server"]

