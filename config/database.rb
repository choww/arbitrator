configure do
# Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

#  DB = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/arbitrators')

  set :database_file, APP_ROOT.join("config", "./database.yml")
#  ActiveRecord::Base.establish_connection(
#    adapter: 'postgresql',
#    host: 'localhost',
#    username: 'testuser',
#    password: '',
#    database: DB.path[1..-1],
#    encoding: 'utf8'
#  )
	
#set :database, {
#  adapter: "postgresql",
#  database: "",
#  username: "testuser",
#  password: "",
#  host: "localhost"
#}
	
	  #: Load all models from app/models, using autoload instead of require
	  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
	  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
	    filename = File.basename(model_file).gsub('.rb', '')
	    autoload ActiveSupport::Inflector.camelize(filename), model_file
	  end
	
end

