require 'faker'

puts('Pupulating users...')

15.times do
  User.create!({
                 name: Faker::Name.first_name,
                 username: Faker::Internet.unique.username(specifier: 5..10, separators: %w[_ -]),
                 email: Faker::Internet.unique.email,
                 lastname: Faker::Name.last_name,
                 photo: '',
                 password: '123456',
                 password_confirmation: '123456'
               })
end

puts('User population complete')
puts('Pupulating posts...')

users = User.all

users.each do |u|
  3.times do
    u.posts.create({
                     content: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
                     author_id: u.id
                   })
  end
end

puts('Post population complete')

user1 = users.first
user2 = users.last
user3 = users[3]

puts('Pupulating users follows')

user1.follow(user2)
user3.follow(user1)
user2.follow(user3)

puts('Follow population complete')
puts('Pupulating groups...')

puts(user1.id)
puts(user2.id)
puts(user3.id)

group1 = Group.create({ admin: user1, name: 'Group 1' })
group2 = Group.create({ admin: user2, name: 'Group 2' })
group3 = Group.create({ admin: user3, name: 'Group 3' })

puts('Group population complete')
puts('Pupulating group members...')

GroupMembership.create({ member: user2, group: group1 })
GroupMembership.create({ member: user3, group: group2 })
GroupMembership.create({ member: user1, group: group3 })

puts('Group membership population complete')
