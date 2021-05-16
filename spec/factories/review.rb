FactoryBot.define do
  factory :review do
    Tmdb::Api.key(ENV['API_KEY'])
    @popular_movie = JSON.parse(Tmdb::Movie.popular.to_json)

    title { Faker::Lorem.characters(number: 50) }
    body { Faker::Lorem.characters(number: 200) }
    rate { 5.0 }
    movie_title { "ウィズアウト・リモース" }
    release_date { "2021-04-29" }
    overview { "『ウィズアウト・リモース』は、2021年公開のアメリカ合衆国のアクションスリラー映画。監督はステファノ・ソリマ、出演はマイケル・B・ジョーダンとジェイミー・ベルなど。原作はトム・クランシーの「容赦なく」。Amazonプライム・ビデオの独占配信であり、劇場公開は見 送られた。" }
    poster_path { "/rEm96ib0sPiZBADNKBHKBv5bve9.jpg" }
    tmdb { 567189 }

    association :user
  end
  factory :user do
    name { Faker::Lorem.characters(number: 20) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }
  end
end
