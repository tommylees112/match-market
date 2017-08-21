class AddColumnsToMatchModel < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :home_team, :string
    add_column :matches, :away_team, :string
    add_column :matches, :goalsHomeTeam, :integer
    add_column :matches, :goalsAwayTeam, :integer
    add_column :matches, :match_date, :datetime
    add_column :matches, :gameweek, :integer
    add_column :matches, :league, :string
  end
end
