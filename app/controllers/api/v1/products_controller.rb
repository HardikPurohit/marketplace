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
          render json: { message: 'Price updated successfully!!', status: 200 }
        end
      end

      private

      def find_product
        @product = Product.find_by(id: params[:id])
      end
    end
  end
end