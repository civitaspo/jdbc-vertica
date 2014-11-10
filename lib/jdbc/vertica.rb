warn "Jdbc-Vertica is only for use with JRuby" if (JRUBY_VERSION.nil? rescue true)
require 'jdbc/vertica/version'

module Jdbc
  module Vertica

    def self.driver_jar
      "vertica-jdbc-#{DRIVER_VERSION}-0.jar"
    end

    def self.load_driver(method = :load)
      send method, driver_jar
    end

    def self.driver_name
      'com.vertica.jdbc.Driver'
    end

    if defined?(JRUBY_VERSION) && # enable backwards-compat behavior :
      ( Java::JavaLang::Boolean.get_boolean("jdbc.driver.autoload") ||
        Java::JavaLang::Boolean.get_boolean("jdbc.vertica.autoload") )
      warn "autoloading JDBC driver on require 'jdbc/vertica'" if $VERBOSE
      load_driver :require
    end
  end
end

