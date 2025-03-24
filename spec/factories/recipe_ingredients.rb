FactoryBot.define do
  factory :recipe_ingredient do
    recipe { nil }
    ingredient { nil }
    quantity { "9.99" }
    unit { 1 }
    critical { false }
  end
end
