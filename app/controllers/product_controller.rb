# frozen_string_literal: true

class ProductController < ApplicationController
  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id]).page params[:page]
  end

  def search
    @products = Product.joins('INNER JOIN catagories ON catagories.id = products.catagories_id').where('products.name LIKE ? AND catagories.id LIKE ?', "%#{params[:search_term]}%", "%#{params[:catagory]}%")
  end
end
