
user = User.new(firstname: "Test", lastname: "Admin", admin: true, email: "admin@gmail.com",
                password: "testadmin", password_confirmation: "testadmin")
user.save!
5.times do |i|
  user = User.new(firstname: "Jan", lastname: "Nowak#{i}", email: "Jan.#{i}@nowak.pl",
                  password: "12345678", password_confirmation: "12345678")
  user.save!
end

category = Category.new(name: "Others")
category.save!

6.times do |i|
  product = Product.new(title: "Test Product #{i}", description: "Amazing test product",
                        price: 500*i, category_id:1, user_id: i+1)
  product.save!
end

5.times do |i|
  6.times do |j|
    3.times do |k|
      review = Review.new(content: "Test review", rating: k+1, created_at: "2015-05-1#{j+k} 9:34:1#{k}",
                          product_id: j+1, user_id: i+2)
      review.save!
    end
  end
end
