namespace :test do
  desc "run all tests"
  task all: :environment do
    ["rspec spec", "cucumber"].each do |cmd|
      puts "Starting to run #{cmd}..."
      system("export DISPLAY=:99.0 && bundle exec #{cmd}")
      raise "#{cmd} failed!" unless $?.exitstatus == 0
    end
  end
end
