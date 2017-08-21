class AddColumnToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :home_logo, :string
    add_column :matches, :away_logo, :string
  end
end
