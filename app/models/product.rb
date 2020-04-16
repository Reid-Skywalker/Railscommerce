# frozen_string_literal: true

class Product < ApplicationRecord

  max_paginates_per 6

  has_one_attached :image
  belongs_to :catagory, optional: true

  validates :name, :price, :stock, presence: true
  validates :price, numericality: true
  validates :stock, numericality: { only_integer: true }
end
