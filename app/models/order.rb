# frozen_string_literal: true

class Order < ApplicationRecord
  validates :quantity, :total, presence: true
  validates :total, numericality: true
  validates :quantity, numericality: { only_integer: true }
end
