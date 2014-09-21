require 'json'
require_relative '../../app/models/region'
require_relative '../../app/models/producer'

namespace :data do

  # Checks and ensures task is not run in production.
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  # Custom install for developement environment
  desc "Install"
  task :install => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:populate", "spec"]

  # Custom reset for developement environment
  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]

  # Populates development data
  desc "Populate the database with development data."
  task :populate => :environment do
    puts "#{'*'*(`tput cols`.to_i)}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*'*(`tput cols`.to_i)}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke

    # INSERT BELOW

    # for region data
    path = File.expand_path("../region-data.json", __FILE__)
    file = File.read(path)
    region_data = JSON.parse(file)

    region_data["regions"].each do |region|
      Region.create(region)
    end

    # for producer data
    producer_path = File.expand_path("../producer_data.json", __FILE__)
    producer_file = File.read(producer_path)
    producer_data = JSON.parse(producer_file)

    producer_data.each do |producer|
      Producer.create(producer)
    end

    # for flavor_profile data
    fp_path = File.expand_path("../producer_flavor_profiles.json", __FILE__)
    fp_file = File.read(fp_path)
    fp_data = JSON.parse(fp_file)
    puts fp_data.size

    fp_data.each do |fp|
      FlavorProfile.create(fp)
    end

    # INSERT ABOVE

    puts "#{'*'*(`tput cols`.to_i)}\nThe database has been populated!\n#{'*'*(`tput cols`.to_i)}"
  end

end