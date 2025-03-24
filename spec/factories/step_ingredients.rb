FactoryBot.define do
  factory :step_ingredient do
    step
    ingredient
    optional { false }
  end
end
