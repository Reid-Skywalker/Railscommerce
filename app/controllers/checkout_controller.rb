# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    cart = params[:cart]
    products = Product.find(cart.keys)

    if products.nil?
      redirect_to root_path
      return
    end

    line_items = []
    cart.each do |id, quantity|
      product = Product.find(id)
      line_item = {
        name: product.name,
        amount: product.cost,
        quantity: quantity,
        currency: 'cad'
      }
      line_items << line_item
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success; end

  def cancel; end
end
