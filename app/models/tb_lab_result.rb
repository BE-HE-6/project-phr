class TbLabResult < ApplicationRecord
    has_many :tb_lab_measurements
    belongs_to :tb_lab_result_category, foreign_key: :result_category_id
    
    mount_uploader :doc, DocUploadUploader
    
    validates :name, presence: true
    validates :date_time, presence: true    
    validates :doc, presence: true
end
