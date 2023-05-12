# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.upto(10) do |x|
    if Post.find_by(title: "#{x} заголовок").nil?
        Post.create(
            title: "#{x} заголовок",
            body: "#{x} текст",
            view: x,
            publication_date: "2023-03-#{x}"
        )
    end
   

end
Category.find_or_create_by(value: "Спорт")
Category.find_or_create_by(value: "Кино")
Category.find_or_create_by(value: "Музыка")

puts "seed"

