FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    email { Faker::Internet.email }
    password { 'testando' }
    password_confirmation { 'testando' }

    # factory :admin do
    #   after(:create) {|user| user.add_role(:admin)}
    # end
  end
end
