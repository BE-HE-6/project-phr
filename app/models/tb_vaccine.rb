class TbVaccine < ApplicationRecord
    t.integer :user_id
    t.integer :vaccine_category_id
    t.string :name
    t.string :location
end
