class CreateIntegraEngines < ActiveRecord::Migration
  def change
    create_table :integra_engines do |t|
      t.string :module_name

      t.timestamps
    end
  end
end
