class AddMaxPeopleColumnToOdds < ActiveRecord::Migration[5.0]
  def change
    add_column :odds, :max_people, :integer
  end
end
