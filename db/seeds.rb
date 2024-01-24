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

puts "Creating plants..."
plants_attributes = [
  { name: "Monstera",
  image_url:"https://images.ctfassets.net/b85ozb2q358o/9a1cf0f586cf198d20ac48c219d74e7e1fdecf991436b8c332f204ceab8c2346/84e012be6561dc46b5a00e32efe2e969/image.png",
  garden: garden },
  { name: "Sunflower",
    image_url:"https://hips.hearstapps.com/hmg-prod/images/sunflowers-63fe51093f04d.jpg?crop=0.888888888888889xw:1xh;center,top&resize=1200:*",
    garden: garden },
  { name: "Bonsai",
    image_url:"https://d1mv2b9v99cq0i.cloudfront.net/eyJidWNrZXQiOiJ3ZWItbmluamEtaW1hZ2VzIiwia2V5Ijoic3RvbmVhbmR3YXRlclwvY29udGVudC1pbWFnZVwvQmxvZyBDb3ZlcnMgZm9yIFNXVyAoNSkuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjozMDAwLCJoZWlnaHQiOjIwMDAsImZpdCI6Imluc2lkZSJ9fSwidmVyc2lvbiI6IiJ9",
    garden: garden }
]

plants_attributes.each do |attr|
  plant = Plant.create!(attr)
  puts "#{plant.name} created!"
end