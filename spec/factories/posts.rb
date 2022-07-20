FactoryBot.define do
  factory :post do
    category_id { Faker::Number.within(range: 2..65) }
    brand_id { Faker::Number.within(range: 2..32) }
    gearmodel { Faker::Name.name }
    text { Faker::Lorem.sentence }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
