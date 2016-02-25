require 'rake'
require "sinatra/activerecord/rake"
require "yaml"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

database_config = YAML.load_file(APP_ROOT.join('config', './database.yml'))

desc "create the database"
task "db:create" do
  system("psql -U #{database_config['development']['username']} -d postgres -c \"create database arbitrator\"")
end

desc "drop the database"
task "db:drop" do
  system('psql -U testuser -d postgres -c "drop database arbitrator"')
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end
