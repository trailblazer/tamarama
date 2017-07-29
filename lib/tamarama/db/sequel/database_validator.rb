module Tamarama
  module DB
    module Sequel
      # Keeps the connection up on a infrequently visited website, but makes it slower.
      module DatabaseValidator
        def self.call(database_handle)
          # via a middleware: https://gist.github.com/jacaetevha/3801154
          database_handle.extension(:connection_validator)
          database_handle.pool.connection_validation_timeout = -1 # apparently, this is very slow and shouldn't be really done.
        end
      end
    end
  end
end

