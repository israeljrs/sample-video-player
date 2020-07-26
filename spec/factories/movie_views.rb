FactoryBot.define do
  factory :movie_view do
    movie
    browser { "MyString" }
  end
end
