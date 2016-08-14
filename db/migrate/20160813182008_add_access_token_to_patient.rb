class AddAccessTokenToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :access_token, :string
  end
end
