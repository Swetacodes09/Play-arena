
default_image = File.open(Rails.root.join('app', 'assets', 'images', 'default.jpg'))


15.times do |i|
  sport = Sport.new(
    name: "Sport #{i+1}",
    location: "Location #{i+1}",
    pincode: "Pincode #{i+1}",
    price: rand(10..100), 
    description: "Description for Sport #{i+1}"
  )
  sport.image.attach(io: File.open("#{Rails.root}/app/assets/images/default.jpg"), filename: 'default.jpg')
  sport.save!
end


default_image.close
