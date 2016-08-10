server 'whoindie.com', user: 'w3gist-explorer', roles: %w(app db web)
set :deploy_to, '/var/www/api.gist-explorer.whoindie.com'

# Puma setup
set :puma_bind, 'unix:///var/www/api.gist-explorer.whoindie.com/tmp/sockets/puma.sock'
