# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jason = User.create(username: "jason", first_name: "Jason", last_name: "Tseng", password: "jason", password_confirmation: "jason", email: "jason.f.tseng@gmail.com")

script = Script.create(title: "Once Upon a Play", subtitle: "A musical tragedy")

jason.scripts << script

title = TitlePage.create(title: "Once Upon a Play", byline: "by Jason F. Tseng", address_1: "123 Someplace Street", city: "Somewhere", state: "NY", zip: "10001", phone: "555-123-4567", email: "jason.f.tseng@gmail.com", notes: "For the lonely ones.", script_id: script.id)
