class User < ApplicationRecord
  has_secure_password :password

  has_many :tb_blood_oxygens
  has_many :tb_blood_glucoses
  has_many :tb_documents
  # has_many :tb_lab_results
  has_many :tb_vaccines
  has_many :blood_pressures
  has_many :body_weight_heights

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x, on: :create}
  validates :name, presence: true
  validates :birth_place, presence: true
  validates :birth_date, presence: true
  validates :blood_type, presence: true
  validates :bpjs_id, presence: true, length: { in: 11..13 }
  validates :ktp_id, presence: true, numericality: true, length: { is: 16 }

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
