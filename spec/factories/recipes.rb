FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    description { "MyText" }
    time_in_minutes { 1 }
    portions { 1 }
    complexity_rating { 1 }
    metadata { "" }
  end
end
