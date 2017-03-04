FactoryGirl.define do

  factory :chat do |f|
    f.body Faker::Lorem.paragraph
    user_id           1
    group_id          1
  end
end
