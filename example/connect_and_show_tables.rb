require 'dbi'
require 'dbd/Jdbc'
require 'jdbc-vertica'

$user = 'dbadmin'
$password = '********'
$host = 'vertica.jp'

Jdbc::Vertica.load_driver
DBI.connect(
  "DBI:Jdbc:vertica://#{$host}:5433/",
  $user,
  $password,
  'driver' => 'com.vertica.jdbc.Driver'
) do |dbh|
  puts "Connected"
  p dbh.select_all('select * from dt;')
end
