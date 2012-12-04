class RemoveIntegraEngineIdFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :integra_engine_id
  end

  def down
    add_column :roles, :integra_engine_id, :integer
  end
end
