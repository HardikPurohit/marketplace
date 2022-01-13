# frozen_string_literal: true

module Api
  module V1
    class ProductsController < BaseController
      before_action :find_product, only: :update

      def index
        @products = Product.all
        render json: @products
      end

      def update
        if @product.update(price: params[:price])
          render json: { message: 'Price updated successfully!', status: 200 }
        end
      end

      def total_price
        total_sum = 0
        group_by_products = params[:items].tally
        products = Product.where(code: group_by_products.keys)
        group_by_products.each do |k, v|
          product = products.find{|p| p.code == k}
          if v >= product.items
            total_sum += (product.price - (product.price * product.discount_percentage)) * (v + product.item_added)
          else
            total_sum += v * product.price
          end
        end

        render json: { total_price: total_sum, status: 200 }
      end

      private

      def find_product
        @product = Product.find_by(id: params[:id])
      end
    end
  end
end