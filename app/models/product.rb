# frozen_string_literal: true

class Product < ApplicationRecord

  max_paginates_per 6

  has_one_attached :image
  belongs_to :catagory, optional: true

  validates :name, :cost, :stock, presence: true
  validates :cost, numericality: true
  validates :stock, numericality: { only_integer: true }
end
