# frozen_string_literal: true

class ProductController < ApplicationController
  before_action :initailize_session
  before_action :load_cart
  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id]).page params[:page]
  end

  def search
    @products = Product.joins('INNER JOIN catagories ON catagories.id = products.catagories_id').where('products.name LIKE ? AND catagories.id LIKE ?', "%#{params[:search_term]}%", "%#{params[:catagory]}%")
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  private

  def initailize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
