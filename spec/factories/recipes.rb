FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "Recipe #{n}" }
    description { "A delicious recipe description with cooking instructions." }
    time_in_minutes { rand(15..120) }
    portions { rand(1..8) }
    complexity_rating { rand(1..5) }
    metadata { { is_rescue_recipe: [ true, false ].sample, is_monthly_special: [ true, false ].sample } }

    trait :quick do
      time_in_minutes { rand(5..30) }
    end

    trait :complex do
      complexity_rating { 5 }
    end

    trait :rescue_recipe do
      metadata { { is_rescue_recipe: true } }
    end

    trait :monthly_special do
      metadata { { is_monthly_special: true } }
    end

    # Create a recipe with ingredients
    trait :with_ingredients do
      transient do
        ingredients_count { 3 }
      end

      after(:create) do |recipe, evaluator|
        create_list(:recipe_ingredient, evaluator.ingredients_count, recipe: recipe)
      end
    end
  end
end
