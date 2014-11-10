require 'activerecord-jdbc-adapter'
require 'jdbc-vertica'

class JdbcTest < ActiveRecord::Base
end

$username = 'dbadmin'
$password = '********'
$host = 'veritica.jp'

Jdbc::Vertica.load_driver
ActiveRecord::Base.establish_connection adapter: 'jdbc',
  driver: 'com.vertica.jdbc.Driver',
  url: "jdbc:vertica://#{$host}:5433/",
  username:  $username,
  password: $password,
  database: 'vmain',
  schema_search_path: 'sandbox'
ActiveRecord::Base.connection.execute "SET search_path TO sandbox;"

p JdbcTest.all
