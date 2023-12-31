class Club < ApplicationRecord
    has_many :club_advisors
    has_many :staffs, through: :club_advisors
    has_many :activities
    has_many :club_members
    has_many :students, through: :club_members
    has_one  :form_capacity
    def form_capacity_for_form(form_number)
        form_capacity.find_by(form: form_number)
    end
    #To map the previous categories named column to renamed category column
    def categories
        category
    end
    
    #Will treat all categories as category when saving/updating values, so no need to change 1 by 1 inside the controllers and views
    def categories=(value)
        self.category = value
    end
end