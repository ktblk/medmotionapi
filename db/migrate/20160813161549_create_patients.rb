class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.string :email_address
      t.string :account_number
      t.string :drivers_license_number
      t.string :date_of_death
      t.string :gender
      t.string :ethnicity
      t.string :address
      t.string :primary_provider_id
      t.string :phones
      t.string :insurance_profiles

      t.timestamps
    end
  end
end
