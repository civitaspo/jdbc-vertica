require 'dbi'
require 'dbd/Jdbc'
require 'jdbc-vertica'
require 'dotenv'

# Create .env file containing
# HOSTNAME=
# PORT=
# USERNAME=
# PASSWORD=
Dotenv.load

config = {
  hostname: ENV['HOSTNAME'],
  port:     ENV['PORT'] || "5433",
  username: ENV['USERNAME'],
  password: ENV['PASSWORD'],
}
puts config

Jdbc::Vertica.load_driver
DBI.connect(
  "DBI:Jdbc:vertica://#{config[:hostname]}:#{config[:port]}/",
  config[:username],
  config[:password],
  'driver' => 'com.vertica.jdbc.Driver'
) do |dbh|
  puts "Connected"
  p dbh.select_all('select * from dt;')
end
