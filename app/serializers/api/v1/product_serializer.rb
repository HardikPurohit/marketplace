class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :code, :name, :price
end
