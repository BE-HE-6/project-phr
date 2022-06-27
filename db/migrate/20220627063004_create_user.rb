class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :email
      t.string :password
      t.string :name
      t.string :birth_place
      t.date :birth_date
      t.string :blood_type
      t.string :bpjs_id
      t.string :ktp_id

      t.timestamps
    end
  end
end
