class AddDisplayNameToIntegraEngines < ActiveRecord::Migration
  def change
    add_column :integra_engines, :display_name, :string
  end
end
