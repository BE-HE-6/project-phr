class TbBloodOxygenCondition < ApplicationRecord
    #saturasi normal 95 - 100
    #saturasi normal batas bawah 91 - 94
    #saturasi rendah < 91
    #saturasi bahaya < 70
    
    validates :name, presence: true, uniqueness: true
end
