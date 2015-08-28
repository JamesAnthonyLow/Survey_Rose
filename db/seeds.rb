require 'faker'

10.times do
Post.create(title: Faker::Commerce.product_name, body: Faker::Lorem.paragraph)
end

