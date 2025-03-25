require "rails_helper"

RSpec.describe IngredientSerializer do
  let!(:ingredient) { create(:ingredient) }
  let(:serialized_ingredient) {
    ActiveModelSerializers::SerializableResource.new(
      ingredient,
      serializer: IngredientSerializer,
      adapter: :json_api
    ).as_json
  }

  it "includes the expected attributes" do
    expect(serialized_ingredient[:data][:attributes].keys).to match_array([
      :name, :category
    ])
    expect(serialized_ingredient[:data][:id]).to eq(ingredient.id.to_s)
    expect(serialized_ingredient[:data][:type]).to eq("ingredients")
  end
end
