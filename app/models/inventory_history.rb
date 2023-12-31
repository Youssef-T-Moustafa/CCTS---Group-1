class InventoryHistory < ApplicationRecord
  belongs_to :inventory, dependent: :destroy
end
