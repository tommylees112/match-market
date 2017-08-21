class AddOfficialBooleanColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :official, :boolean
  end
end
