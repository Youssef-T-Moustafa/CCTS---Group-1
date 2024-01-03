class Inventory < ApplicationRecord
  has_many :inventory_histories, dependent: :destroy
end
