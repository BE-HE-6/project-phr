class TbDocumentCategory < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
