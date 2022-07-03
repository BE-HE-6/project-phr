class BloodPressureConditionSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :blood_pressure
end
