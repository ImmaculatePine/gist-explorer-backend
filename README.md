# GistExplorer Backend

This is an API for GistExplorer application. It provides 2 things:

1. GitHub OAuth authentication
2. API for gist labels

## Project setup

1. Copy config files:

        $ cp config/database.yml.example config/database.yml
        $ cp config/secrets.yml.example config/secrets.yml

2. Install bundle

        $ gem install bundler
        $ bundle

3. Create and prepare database

        $ rake db:create
        $ rake db:migrate
        $ rake db:seed
