FactoryBot.define do
  factory :equipment do
    sequence(:name) { |n| "Equipment #{n}" }
  end
end
