FactoryBot.define do
  factory :movie do
    user { nil }
    title { "MyString" }
    description { "MyText" }
    image { "" }
    url { "MyString" }
    published { false }
  end
end
