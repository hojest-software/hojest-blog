FactoryBot.define do
  factory :post do
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph_by_chars(number: 256)  }
  end
end