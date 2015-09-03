class CreateFielders < ActiveRecord::Migration
  def change
    create_table(:fielders) do |t|
      t.column(:player_id, :int)
      t.column(:innings_played, :int)
      t.column(:put_outs, :int)
      t.column(:fielding_errors, :int)
      t.column(:throwing_errors, :int)

      t.timestamps
    end
  end
end
