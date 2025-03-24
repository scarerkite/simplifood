FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
    quantity { rand(1..500).to_f / 100 } # Random decimal between 0.01-5.00
    unit { RecipeIngredient.units.keys.sample }
    critical { [ true, false ].sample }

    trait :critical do
      critical { true }
    end

    trait :optional do
      critical { false }
    end
  end
end
