# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    User.create( 
        name: Faker::FunnyName.two_word_name, 
        avatar: Faker::LoremFlickr.image("250x200"),
        city: Faker::Address.full_address, 
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraph(2),
        password: Faker::Lorem.characters(10)
    )
end 