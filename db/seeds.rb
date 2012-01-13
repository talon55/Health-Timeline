# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'Create Users'
user0 = User.create!(email: 'user0@test.com', password: 'please', password_confirmation: 'please' )
user1 = User.create!(email: 'user1@test.com', password: 'please', password_confirmation: 'please' )
user2 = User.create!(email: 'user2@test.com', password: 'please', password_confirmation: 'please' )

puts 'Create Episodes'
ep0 = user0.episodes.create!(title: "ep0")
ep1 = user0.episodes.create!(title: "ep1")
ep2 = user2.episodes.create!(title: "ep2")
ep3 = user1.episodes.create!(title: "ep3")

puts 'Associate Users with Episodes'
ep0.users << user1
user1.shared_episodes << ep1

puts 'Destroy user2'
user2.destroy
