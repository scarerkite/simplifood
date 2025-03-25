require "rails_helper"

RSpec.describe "Home", type: :system do
  it "loads and mounts the React component" do
    visit "/home"
    expect(page).to have_content("React is working!")
  end
end
