class BloodPressureSerializer < ActiveModel::Serializer
  attributes :id, :sistole, :diastole, :pulse, :note, :date_time, :created_at

  belongs_to :blood_pressure_condition
end
