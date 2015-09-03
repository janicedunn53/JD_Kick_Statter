class AddTeamIdToPlayer < ActiveRecord::Migration
  def change
    add_column(:players, :team_id, :int)
  end
end
