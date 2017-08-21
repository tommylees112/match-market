class AddOfficialBooleanColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :official, :boolean
  end
end
