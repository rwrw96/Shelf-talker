# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: ENV['name'],
             email: ENV['email'],
             password: ENV['password'],
             password_confirmation: ENV['password_confirmation'],
             admin: true)


# 100.times do |n|
#   Review.create(title: "これは面白い#{n}回目", body: "これは面白い。これは面白い。これは面白い。これは面白い。これは面白い。これは面白い。これは面白い。こ...", movie_title: "ウィズアウト・リモース", release_date: "2021-04-29", overview: "『ウィズアウト・リモース』は、2021年公開のアメリカ合衆国 のアクションスリラー映画。監督はステファ...", poster_path: "/rEm96ib0sPiZBADNKBHKBv5bve9.jpg", tmdb: 567189, rate: 5.0, user_id: 16)
# end

