require "rails_helper"

RSpec.describe StepSerializer do
  let!(:step) { create(:step) }
  let(:serialized_step) {
    ActiveModelSerializers::SerializableResource.new(
      step,
      serializer: StepSerializer,
      adapter: :json_api
    ).as_json
  }

  it "includes the expected attributes" do
    expect(serialized_step[:data][:attributes].keys).to match_array([
      :instruction, :order, :"time-in-minutes", :optional
    ])
    expect(serialized_step[:data][:id]).to eq(step.id.to_s)
    expect(serialized_step[:data][:type]).to eq("steps")
  end
end
