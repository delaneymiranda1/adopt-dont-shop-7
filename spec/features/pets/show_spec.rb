require "rails_helper"

RSpec.describe "the shelter show" do
  before :each do
    @shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
  end

  it "shows the shelter and all it's attributes" do
    visit "/pets/#{@pet.id}"

    expect(page).to have_content(@pet.name)
    expect(page).to have_content(@pet.age)
    expect(page).to have_content("Status: Adoptable")
    expect(page).to have_content(@pet.breed)
    expect(page).to have_content(@pet.shelter_name)
  end

  it "allows the user to delete a pet" do
    visit "/pets/#{@pet.id}"

    click_on("Delete #{@pet.name}")

    expect(page).to have_current_path("/pets")
    expect(page).to_not have_content(@pet.name)
  end

  it 'has a button to edit pet that brings user to edit page' do
    visit "/pets/#{@pet.id}"
    click_link "Update #{@pet.name}"
    expect(current_path).to eq("/pets/#{@pet.id}/edit")
  end

end
