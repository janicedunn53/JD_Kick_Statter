class CreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|
      t.column(:name, :string)
      t.column(:position, :string)
      t.column(:jersey_number, :integer)
      t.column(:kicker_id, :integer)
      t.column(:pitcher_id, :integer)
      t.column(:fielder_id, :integer)

      t.timestamps
    end
  end
end
