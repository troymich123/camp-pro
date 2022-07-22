User.create!(
  nickname: "テストキャンパー",
  email: "test@test",
  password: "a000000",
  password_confirmation: "a000000"
)

10.times do |n|
  User.create!(
    nickname: Faker::JapaneseMedia::DragonBall.character,
    email: Faker::Internet.unique.email,
    password: "a000000",
    password_confirmation: "a000000"
  )
end

10.times do |n|
  User.first(2).each do |user|
    user.posts.create!(
      user_id: user.id,
      category_id: Faker::Number.within(range: 2..65),
      brand_id: Faker::Number.within(range: 2..32),
      gearmodel: Faker::JapaneseMedia::Doraemon.gadget,
      text: Faker::Lorem.paragraph
    )
  end
end

6.times do |n|
  User.find(1) do |user|
    user.posts.create!(
      user_id: user.id,
      category_id: Faker::Number.within(range: 2..65),
      brand_id: Faker::Number.within(range: 2..32),
      gearmodel: Faker::JapaneseMedia::Doraemon.gadget,
      text: Faker::Lorem.paragraph,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/test.jpg"), filename:"test.jpg")
    )
  end
end