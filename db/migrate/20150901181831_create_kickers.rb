class CreateKickers < ActiveRecord::Migration
  def change
    create_table(:kickers) do |t|
      t.column(:player_id, :integer)
      t.column(:hits, :integer)
      t.column(:at_bats, :integer)
      t.column(:singles, :integer)
      t.column(:doubles, :integer)
      t.column(:triples, :integer)
      t.column(:home_runs, :integer)
      t.column(:runs, :integer)
      t.column(:rbi, :integer)
      t.column(:walks, :integer)
      t.column(:strikeouts, :integer)

      t.timestamps
    end
  end
end
