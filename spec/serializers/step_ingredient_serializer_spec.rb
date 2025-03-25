require "rails_helper"

RSpec.describe StepIngredientSerializer do
  let(:step) { create(:step) }
  let(:ingredient) { create(:ingredient) }
  let!(:step_ingredient) { create(:step_ingredient, step: step, ingredient: ingredient) }
  let(:serialized_step_ingredient) {
    ActiveModelSerializers::SerializableResource.new(
      step_ingredient,
      serializer: StepIngredientSerializer,
      include: [ "ingredient", "step" ],
      adapter: :json_api
    ).as_json
  }

  # JSON API format converts attribute names to kebab-case
  it "includes the expected attributes" do
    expect(serialized_step_ingredient[:data][:attributes].keys).to match_array([
      :optional
    ])
    expect(serialized_step_ingredient[:data][:id]).to eq(step_ingredient.id.to_s)
    expect(serialized_step_ingredient[:data][:type]).to eq("step-ingredients")
  end

  it "includes nested associations" do
    expect(serialized_step_ingredient[:data][:relationships].keys).to include(:ingredient, :step)

    included_data = serialized_step_ingredient[:included]
    ingredient_data = included_data.find do |item|
      item[:type] == "ingredients" &&
      item[:id] == ingredient.id.to_s
    end

    step_data = included_data.find do |item|
      item[:type] == "steps" &&
      item[:id] == step.id.to_s
    end

    expect(step_data[:attributes][:instruction]).to eq(step.instruction)
    expect(ingredient_data[:attributes][:name]).to eq(ingredient.name)
  end
end
