# coding: utf-8

User.create!( name: "管理者",
              email: "admin@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)

30.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

30.times do |m|
  name = "タスク#{m+1}"
  content = "タスク詳細"
  user_id = 1
  Task.create!(name: name,
               content: content,
               user_id: user_id,
              )
end