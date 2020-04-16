# frozen_string_literal: true

class Catagory < ApplicationRecord
  has_many :product
  validates :name, presence: true
end
