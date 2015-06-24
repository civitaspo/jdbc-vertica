require 'activerecord-jdbc-adapter'
require 'jdbc-vertica'
require 'dotenv'

class JdbcTest < ActiveRecord::Base
end

# Create .env file containing
# HOSTNAME=
# PORT=
# DATABASE=
# USERNAME=
# PASSWORD=
Dotenv.load

config = {
  hostname: ENV['HOSTNAME'],
  port:     ENV['PORT'] || "5433",
  username: ENV['USERNAME'],
  password: ENV['PASSWORD'],
  database: ENV['DATABASE'] || "vmain",
}
puts config

Jdbc::Vertica.load_driver
ActiveRecord::Base.establish_connection adapter: 'jdbc',
  driver: 'com.vertica.jdbc.Driver',
  url: "jdbc:vertica://#{config[:hostname]}:#{config[:port]}/",
  username: config[:username],
  password: config[:password],
  database: config[:database],
  schema_search_path: 'sandbox'
ActiveRecord::Base.connection.execute "SET search_path TO sandbox;"

p JdbcTest.all
