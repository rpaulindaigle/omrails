namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      name = Faker::Name.name
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end

    User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      10.times do |n|
        image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
        description = %w(shirt t-shirt button_up jeans pants knitshirt accessory).sample
        brand = ["Armani", "Hugo Boss", "BOSS Orange", "Pink Tartan", "G-Star"].sample
        price = %w($79 $124 $341 $263 $105 $210 $228 $68).sample
        sale_price = %w($70 $110 $254 $168 $310 $41 $102).sample
        material = %w(cotton cashmere wool nylon).sample

        user.products.create!(image: image, description: description, brand: brand, price: price, sale_price: sale_price, material: material)
      end
    end
  end
end