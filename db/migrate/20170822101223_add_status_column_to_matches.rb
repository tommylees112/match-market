class AddStatusColumnToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :status, :string
  end
end
