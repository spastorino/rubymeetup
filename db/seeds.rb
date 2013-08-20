# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  User.create(:name => "User #{i}")
end

20.times do |i|
  p = Post.new(:title => "Title #{i}", :user_id => (i % 10 + 1), :like_count => i, :featured => false)
  p.category = case (i % 3)
               when 0
                 'ongoing'
               when 1
                 'upcoming'
               when 2
                 'this_week'
               end
  p.save
end
