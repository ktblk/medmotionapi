class AddWithDoctorToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :with_doctor, :boolean
  end
end
