set :stage, :production
set :branch, 'master'
set :deploy_to, '/work/www/ecodozor.rf'

server "188.226.173.135", roles: [:web, :app, :db], user: 'd4mk0', primary: true
