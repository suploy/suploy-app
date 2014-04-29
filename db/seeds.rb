# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  puts "Add development user"
  user = User.new({username: "test", email: 'test@example.com', password: 'test', password_confirmation: 'test'})
  user.confirmation_sent_at = Time.now
  user.skip_confirmation!
  user.save!(:validate => false)

  50.times do |i|
    puts "Add development user"
    user = User.new({username: "test#{i}", email: "test#{i}@example.com", password: 'test', password_confirmation: 'test'})
    user.confirmation_sent_at = Time.now
    user.skip_confirmation!
    user.save!(:validate => false)
  end
end

puts "Add development admin"
user = User.new({username: "admin", email: 'admin@example.com', password: 'test', password_confirmation: 'test', admin: true})
user.confirmation_sent_at = Time.now
user.skip_confirmation!
user.save!(:validate => false)
