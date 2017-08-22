class ChangeOddTypeToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :odds, :odds, :float
  end
end
