class AddWonColumnToOddTable < ActiveRecord::Migration[5.0]
  def change
    add_column :odds, :won, :boolean
  end
end
