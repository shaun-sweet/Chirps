5.times do
  User.create(
    username: Faker::Internet.user_name,
    password: "password",
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: Faker::Avatar.image
    )
end

20.times do
  Chirp.create(
    user_id: rand(1..5),
    body: Faker::Lorem.paragraph
    )
end
60.times do
  Comment.create(
    body: Faker::Lorem.paragraph,
    user_id: rand(1..5),
    chirp_id: rand(1..20)
    )
end

40.times do
  Like.create(
    user_id: rand(1..5),
    comment_id: rand(1..60),
    chirp_id: rand(1..20)
    )
end

