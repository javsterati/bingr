# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# https://github.com/faker-ruby/faker#faker
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'


shows = RestClient.get'http://api.tvmaze.com/shows'
shows_array = JSON.parse(shows)

shows_array.each do |show|
    Show.create(title: show["name"], desc: show["summary"], episode_count: rand(20..200), image: show["image"]["medium"], genre: show["genres"][rand(0..2)])
end






def most_common_value(array)
    #This evaluates the genre array and returns the most liked genres. 
    array.group_by do |genre|
        genre
     end.values.max_by(&:size).first
end
