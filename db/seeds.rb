5.times do |n|
  address = Faker::Address.city
  Category.create!(address: address)
end

categories = Category.all
10.times do |n|
  name = Faker::Name.name
  address = Faker::Address.street_name
  price = Faker::Number.decimal(10)
  time_from = Time.zone.now.strftime("%Y-%m-%d")
  time_to = Faker::Time.forward(3, :morning)
  tour_info = Faker::Lorem.paragraph(2)
  categories.each {|c| c.tours.create!(name: name, address: address, price: price,
    time_from: time_from, time_to: time_to, tour_info: tour_info)}
end
