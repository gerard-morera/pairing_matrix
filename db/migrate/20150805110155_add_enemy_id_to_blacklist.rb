class AddEnemyIdToBlacklist < ActiveRecord::Migration
  def change
    add_column :blacklists, :enemy_id, :integer
  end
end
