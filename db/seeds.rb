Pet.destroy_all
Shelter.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



@shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
@shelter_2 = Shelter.create(name: "RGV animal shelter", city: "Harlingen, TX", foster_program: false, rank: 5)
@shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)


@shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
@shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
@shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
@pet_1 = Pet.create(adoptable: true, age: 7, breed: "sphynx", name: "Bare-y Manilow", shelter_id: @shelter_1.id)
@pet_2 = Pet.create(adoptable: true, age: 3, breed: "domestic pig", name: "Babe", shelter_id: @shelter_1.id)
@pet_3 = Pet.create(adoptable: true, age: 4, breed: "chihuahua", name: "Elle", shelter_id: @shelter_1.id)

@vet_office_1 = VeterinaryOffice.create(name: "Special Friends", boarding_services: true, max_patient_capacity: 100)
@vet_office_2 = VeterinaryOffice.create(name: "Pet Emergency Room", boarding_services: true, max_patient_capacity: 50)
@vet_office_3 = VeterinaryOffice.create(name: "The Country Vet", boarding_services: true, max_patient_capacity: 200)
@vet_office_1.veterinarians.create(name: "Morgan", on_call: true, review_rating: 10)
@vet_office_1.veterinarians.create(name: "Heather", on_call: true, review_rating: 9)
@vet_office_3.veterinarians.create(name: "John", on_call: true, review_rating: 9)


@vet_office = VeterinaryOffice.create(name: "Best Vets", boarding_services: true, max_patient_capacity: 20)
@vet_1 = Veterinarian.create(name: "Taylor", review_rating: 10, on_call: true, veterinary_office_id: @vet_office_1.id)
@vet_2 = Veterinarian.create(name: "Jim", review_rating: 8, on_call: true, veterinary_office_id: @vet_office_1.id)
