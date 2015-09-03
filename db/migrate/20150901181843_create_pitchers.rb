class CreatePitchers < ActiveRecord::Migration
  def change
    create_table(:pitchers) do |t|
      t.column(:player_id, :integer)
      t.column(:batters_faced, :integer)
      t.column(:wins, :integer)
      t.column(:losses, :integer)
      t.column(:earned_runs, :integer)
      t.column(:runs, :integer)
      t.column(:hits, :integer)
      t.column(:home_runs, :integer)
      t.column(:walks, :integer)
      t.column(:strikeouts, :integer)
      t.column(:wild_pitch, :integer)
      t.column(:saves, :integer)
      t.column(:strikes, :integer)
      t.column(:balls, :integer)
      t.column(:pitches, :integer)

      t.timestamps
    end
  end
end
