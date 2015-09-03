class AddRosterIdToPlayer < ActiveRecord::Migration
  def change
    add_column(:players, :roster_id, :integer)
  end
end
