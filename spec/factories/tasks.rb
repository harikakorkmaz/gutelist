FactoryBot.define do
  factory :task do
    task_ja { Faker::Lorem.characters(number:10) }
    task_en { Faker::Lorem.characters(number:10) }
    user
  end
end