# app/models/form_capacity.rb
class FormCapacity < ApplicationRecord
    belongs_to :club
  
    validate :total_capacity_within_limit
  
    private
  
    def total_capacity_within_limit
      total_capacity = f1.to_i + f2.to_i + f3.to_i + f4.to_i + f5.to_i
      if total_capacity > club.capacity
        errors.add(:base, "Total form capacity exceeds maximum cl")
      end
    end
end
