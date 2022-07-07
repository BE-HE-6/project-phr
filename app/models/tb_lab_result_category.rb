class TbLabResultCategory < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
