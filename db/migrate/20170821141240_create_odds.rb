class CreateOdds < ActiveRecord::Migration[5.0]
  def change
    create_table :odds do |t|
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :odds
      t.string :outcome

      t.timestamps
    end
  end
end
