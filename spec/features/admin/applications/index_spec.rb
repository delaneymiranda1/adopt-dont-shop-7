require "rails_helper"

RSpec.describe "the admin applications index" do
  it "lists all the applications" do
    application_1 = Application.create!(name: "Stacy Chapman", street_address: "1870 Canopy Rd", city: "Los Angeles", state: "CA", zip_code: 90001, description: "I grew up with dachshunds and felt really connected", status: "In Progress")
    application_2 = Application.create!(name: "Charlie Moon", street_address: "340 Walker St", city: "San Diego", state: "CA", zip_code: 91911, description: "I really am hoping to find a new companion for my parrot", status: "In Progress")

    visit "/admin/applications"

    expect(page).to have_content(application_1.name)
    expect(page).to have_content(application_2.name)
  end

  it "has link to admin application show page" do
    application_1 = Application.create!(name: "Stacy Chapman", street_address: "1870 Canopy Rd", city: "Los Angeles", state: "CA", zip_code: 90001, description: "I grew up with dachshunds and felt really connected", status: "In Progress")
    application_2 = Application.create!(name: "Charlie Moon", street_address: "340 Walker St", city: "San Diego", state: "CA", zip_code: 91911, description: "I really am hoping to find a new companion for my parrot", status: "In Progress")
    visit "/admin/applications"
    click_link "#{application_1.name}"
    expect(current_path).to eq("/admin/applications/#{application_1.id}")
  end
end