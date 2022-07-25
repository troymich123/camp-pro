[
  ['1', 'ルーキーⅣ', '0'],
  ['2', 'ルーキーⅢ', '1'],
  ['3', 'ルーキーⅡ', '2'],
  ['4', 'ルーキーⅠ', '3'],
  ['5', 'ブロンズⅣ', '4'],
  ['6', 'ブロンズⅢ', '6'],
  ['7', 'ブロンズⅡ', '8'],
  ['8', 'ブロンズⅠ', '10'],
  ['9', 'シルバーⅣ', '12'],
  ['10', 'シルバーⅢ', '15'],
  ['11', 'シルバーⅡ', '18'],
  ['12', 'シルバーⅠ', '21'],
  ['13', 'ゴールドⅣ', '24'],
  ['14', 'ゴールドⅢ', '28'],
  ['15', 'ゴールドⅡ', '32'],
  ['16', 'ゴールドⅠ', '36'],
  ['17', 'プラチナⅣ', '40'],
  ['18', 'プラチナⅢ', '45'],
  ['19', 'プラチナⅡ', '50'],
  ['20', 'プラチナⅠ', '55'],
  ['21', 'ダイアモンドⅣ', '60'],
  ['22', 'ダイアモンドⅢ', '66'],
  ['23', 'ダイアモンドⅡ', '72'],
  ['24', 'ダイアモンドⅠ', '78'],
  ['25', 'マスター', '84'],
  ['26', 'プレデター', '92']
].each do |rank, rank_name, threshold|
  RankSetting.create!(
    { rank: rank, rank_name: rank_name, threshold: threshold}
  )
end

User.create!(
  nickname: "家族キャンパー",
  email: "test@test",
  password: "a000000",
  password_confirmation: "a000000",
  rank: "26",
  rank_name: "プレデター",
  exp_point: "92"
)

User.create!(
  nickname: "ソロキャンパー",
  email: "test2@test",
  password: "a000000",
  password_confirmation: "a000000",
  rank: "25",
  rank_name: "マスター",
  exp_point: "84"
)

8.times do |n|
  User.create!(
    nickname: Faker::JapaneseMedia::DragonBall.character,
    email: Faker::Internet.unique.email,
    password: "a000000",
    password_confirmation: "a000000"
  )
end

2.times do |n|
  User.all.each do |user|
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

[
  ['1', '2'],
  ['1', '3'],
  ['1', '4'],
  ['1', '5'],
  ['1', '6'],
  ['2', '1'],
  ['3', '1'],
  ['4', '1'],
  ['5', '1'],
  ['6', '1']
].each do |follower_id, followed_id|
  Relationship.create!(
    { follower_id: follower_id, followed_id: followed_id}
  )
end

AdminUser.create!(email: 'admin@admin', password: 'password', password_confirmation: 'password') if Rails.env.development?