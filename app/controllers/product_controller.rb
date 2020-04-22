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
    q = 1
    product = { id => q }
    session[:cart].merge!(product) unless session[:cart].include?(product)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)
    redirect_to root_path
  end

  def increment
    id = params[:id]
    session[:cart][id] += 1
    redirect_to root_path
  end

  def decriment
    id = params[:id]
    q = session[:cart][id]
    if q > 1
      session[:cart][id] -= 1
    else
      session[:cart].delete(id)
    end
    redirect_to root_path
  end

  private

  def initailize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end
end
