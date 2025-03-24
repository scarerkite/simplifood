FactoryBot.define do
  factory :step do
    recipe { nil }
    instruction { "MyText" }
    order { 1 }
    time_in_minutes { 1 }
    optional { false }
  end
end
