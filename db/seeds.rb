# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BreedDog.delete_all
Dog.delete_all
Breed.delete_all
Owner.delete_all

NUMBER_OF_DOGS_PER_BREED = 4
BREEDS_URL = "https://dog.ceo/api/breeds/list/all"
uri = URI(BREEDS_URL)
response = Net::HTTP.get(uri)

breeds_json = JSON.parse(response)["message"]

# list_breed(breeds_json, "->")

# Creating breeds
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

# Creating owners
50.times do
  Owner.create(name:  "#{Faker::Name.prefix} #{Faker::Name.first_name} #{Faker::Name.middle_name} #{Faker::Name.last_name}",
               age:   rand(3..58),
               story: "#{Faker::Job.title} at #{Faker::Company.name} #{Faker::Company.industry}. #{Faker::Lorem.paragraph(sentence_count: 4)}")
end

# Creating dogs and attaching breeds
id_inc = Owner.first.id
id_count = Owner.count

breed_inc = Breed.first.id
breed_count = Breed.count

Breed.all.each do |breed|
  gender = Faker::Creature::Dog.gender
  size = Faker::Creature::Dog.size

  dog = Owner.find(rand(id_inc...(id_count + id_inc))).dogs.find_or_create_by(
    name:   "#{size} #{gender} #{Faker::Creature::Dog.name} #{breed.title}",
    age:    rand(1..15),
    gender: gender.to_s,
    size:   size.to_s
  )

  unless dog.valid?
    # for each column check for errors:
    dog.errors.messages.each do |column, errors|
      # for each message ON each column:
      errors.each do |error|
        puts "ERROR: #{column} #{error}"
      end
    end
  end

  dog.breed_dogs.find_or_create_by(breed_id: breed.id)
  rand(0..2).times do
    dog.breed_dogs.find_or_create_by(breed_id: Breed.find(rand(breed_inc...(breed_count + breed_inc))).id)
  end
end

puts "Created #{Breed.count} Breeds."
puts "Created #{Owner.count} Owners."
puts "Created #{Dog.count} Dogs."
puts "Created #{BreedDog.count} BreedDogs."
