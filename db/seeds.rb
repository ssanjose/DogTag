# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Breed.delete_all
Owner.delete_all
Dog.delete_all
BreedDog.delete_all

NUMBER_OF_DOGS_PER_BREED = 4
BREEDS_URL = "https://dog.ceo/api/breeds/list/all"
uri = URI(BREEDS_URL)
response = Net::HTTP.get(uri)

breeds_json = JSON.parse(response)["message"]

# list_breed(breeds_json, "->")

breeds_json.each do |name, value|
  breed = Breed.create(
    title: name
  )

  next unless value.length.positive?

  value.each do |sub_breed|
    breed.sub.create(
      title: sub_breed
    )
  end
end

Breed.all.each do |breed|
  breed.find_or_create_by
end

puts "Created #{Breed.count} Breeds."
