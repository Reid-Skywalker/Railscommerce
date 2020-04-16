# frozen_string_literal: true

ActiveAdmin.register Contact do
  permit_params :title,:content,:email,:phone
end
