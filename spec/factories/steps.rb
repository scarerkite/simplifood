FactoryBot.define do
  factory :step do
    recipe
    instruction { "Boil some water" }
    order { 1 }
    time_in_minutes { 1 }
    optional { false }
  end
end
