require_relative "stack/env"
require_relative "stack/db"

# database tasks
require "dotenv/tasks"

require "sequel/extensions/migration"
namespace :db do
  desc "Run migrations up to specified version or to latest."
  task :migrate, [:version] => [:dotenv] do |_, args|
    version = args[:version]
    migrations_directory = "migrations"

    db = DB.connect

    message = if args[:version].nil?
                Sequel::Migrator.run(db, migrations_directory)
                "Migrated to latest"
              else
                Sequel::Migrator.run(db, migrations_directory, target: version.to_i)
                "Migrated to version #{version}"
              end

    puts message# if environment != "test"
  end

  task :debug => [:dotenv] do
    db = DB.connect
    puts "=== DB: #{db.uri}"
    puts db.schema(:users).inspect
    # puts User::Persistence.db_schema
    # puts User::Persistence.dataset.all.inspect
  end
end

task :default => :test
require "rake/testtask"

desc 'Default: run tests.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
