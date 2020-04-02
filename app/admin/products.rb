# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :cost, :stock, :catagories_id, :image

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :name
      f.input :cost
      f.input :stock
      f.input :image, as: :file
      f.input :catagories_id, as: :select, collection: Catagory.all.collect { |category| [category.name, category.id] }
    end

    f.actions
  end
end
