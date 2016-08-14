class AddWaitingRoomToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :waiting_room, :boolean
  end
end
