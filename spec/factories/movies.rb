FactoryBot.define do
  factory :movie do
    user
    title { "MyString" }
    description { "MyText" }
    url { "MyString" }
    published { true }
  end
end
