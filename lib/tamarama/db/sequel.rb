require "sequel"

module Tamarama
  module DB
    module Sequel
      def self.call()
        ::Sequel::Model.strict_param_setting = false
        ::Sequel::Database.extension :pg_json
        ::Sequel.extension :pg_json_ops

        environment       = ENV["RACK_ENV"]
        connection_string = ENV["DATABASE_URL"]
        raise "Missing Connection string" if connection_string.nil?

        ::Sequel.connect(connection_string)
      end
    end
  end
end

# Sequel::Database.extension :"uuid"
# Sequel::Model.plugin :timestamps
