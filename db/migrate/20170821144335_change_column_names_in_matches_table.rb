class ChangeColumnNamesInMatchesTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :matches, :goalsHomeTeam, :goals_home_team
    rename_column :matches, :goalsAwayTeam, :goals_away_team
  end
end
