class Product < ApplicationRecord
  # validations
  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true
end
