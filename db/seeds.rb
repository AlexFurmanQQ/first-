# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.upto(10) do |x|
    title = Faker::Book.title
    if Post.find_by(title: title).nil?
        Post.create(
            title: title,
            body: Faker::Lorem.sentence(word_count: 30),
            view: Faker::Number.number(digits: 2),
            publication_date: "2023-03-#{x}"
        )
    end
end

Category.find_or_create_by(value: "Спорт")
Category.find_or_create_by(value: "Кино")
Category.find_or_create_by(value: "Музыка")

puts "seed"

