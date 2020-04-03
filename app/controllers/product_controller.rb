# frozen_string_literal: true

class ProductController < ApplicationController
  def index
    @products = Product.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('name LIKE ?', "%#{params[:search_term]}%")
  end
end
