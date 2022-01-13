# frozen_string_literal: true

puts '####### Creating Products #######'

PRODUCTS = [{code: 'MUG', name: 'Reedsy Mug', price: 6.00, items: 2, discount_percentage: 0, item_added: -1},
  { code: 'TSHIRT', name: 'Reedsy T-shirt', price: 15.00, items: 3, discount_percentage: 0.3, item_added: 0},
  {code: 'HOODIE', name: 'Reedsy Hoodie', price: 20.00, items: 0, discount_percentage: 0, item_added: 0}]


PRODUCTS.each do |product|
  Product.find_or_create_by(code: product[:code], name: product[:name], price: product[:price], items: product[:items], discount_percentage: product[:discount_percentage], item_added: product[:item_added])
end

puts '####### Products created #######'
