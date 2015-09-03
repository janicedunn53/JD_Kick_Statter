class DropRosterIdFromPlayer < ActiveRecord::Migration
  def change
    remove_column(:players, :roster_id, :int)
  end
end
