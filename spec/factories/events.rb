FactoryBot.define do
  factory :event do
    association :user
    title { 'bbb party' }
    address { 'Minsk' }
    datetime { Time.now + rand(1..4).days }
  end
end
