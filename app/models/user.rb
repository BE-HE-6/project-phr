class User < ApplicationRecord
  # has_many :tb_blood_oxygens
  # has_many :tb_blood_glucoses
  # has_many :tb_documents
  # has_many :tb_lab_results
  # has_many :tb_vaccines
  # has_many :tb_blood_pressures
  # has_many :tb_body_weight_heights

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :password, length: { minimum: 8 }
  validates :name, presence: true
  validates :birth_place, presence: true
  validates :birth_date, presence: true
  validates :blood_type, presence: true
  validates :bpjs_id, presence: true, length: { in: 11..13 }
  validates :ktp_id, presence: true, numericality: true, length: { is: 16 }
  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number
  #
  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 uppercase '
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 lowercase '
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, ' must contain special character'
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end
end
