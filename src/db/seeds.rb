# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for i in 1..100 do
    User.create( 
        name: Faker::FunnyName.two_word_name, 
        remote_avatar_url: Faker::LoremFlickr.image("250x250"),
        city: Faker::Address.full_address, 
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraph(2),
        password: "testing1"
    )
end


for i in 1..100 
    Skill.create(
        name: Faker::ProgrammingLanguage.name
    )
    Interest.create(
        user_id: User.find(i).id,
        skill_id: Skill.find(i).id
    )
    Service.create(
        user_id: User.find(i).id,
        skill_id: Skill.find(i).id,
        experience: rand(4),
        description: Faker::Lorem.paragraph(2),
        price: rand(50)   
    )
end


for i in 1..100
    Review.create(
        content: Faker::Lorem.paragraph(2),
        user_id: User.find(rand(1..20)).id,
        service_id: Service.find(rand(1..50)).id
    ) 
end 


for i in 1..100
    Purchase.create(
        service_id: i, 
        user_id: i, 
        charge_id: 123, 
        price: rand(50))
end