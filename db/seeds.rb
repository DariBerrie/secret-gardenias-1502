# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Garden.destroy_all if Rails.env.development?

garden = Garden.new(
  name: "Rosita's Garden",
  image_url: "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_16:9/at%2Freal-estate%2Flongwood-gardens"
)

garden.save!

puts "#{garden.name} created!"

plant_attributes = {
  name: "Monstera",
  image_url:"https://images.ctfassets.net/b85ozb2q358o/9a1cf0f586cf198d20ac48c219d74e7e1fdecf991436b8c332f204ceab8c2346/84e012be6561dc46b5a00e32efe2e969/image.png",
  garden: garden
}

plant = Plant.create!(plant_attributes)