# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Song.destroy_all
Artist.destroy_all

artist1 = Artist.create!(name:"Michael", remote_image_url:"http://www.uaway.com")
artist2 = Artist.create!(name:"Miew", remote_image_url:"http://www.uaway.com")
artist3 = Artist.create!(name:"allo", remote_image_url:"http://www.uaway.com")

song1 = Song.create!(title:"leave", song_url:"http://www.uaway.com", artist:artist1)
song2 = Song.create!(title:"again", song_url:"http://www.uaway.com", artist:artist2)
song3 = Song.create!(title:"again", song_url:"http://www.uaway.com", artist:artist3)
