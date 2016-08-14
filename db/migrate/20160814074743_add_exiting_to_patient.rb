class AddExitingToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :exiting, :boolean
  end
end
