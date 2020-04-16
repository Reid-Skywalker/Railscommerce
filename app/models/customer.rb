# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, :address, :phone, :email, presence: true
end
