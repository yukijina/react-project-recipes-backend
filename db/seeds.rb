# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  yuki = User.create(username: "yuki", password: "test")
#  stacey = User.create(username: "stacey", password: "test")

def create_user(names)
    names.map do |name|
        User.create!(
            username: name,
            password: "test"
    )
    end 
end 


create_user(["yuki", "julie", "paul", "stacey", "john"])
