class CreateIntegraEngineMigrateds < ActiveRecord::Migration
  def change
    create_table :integra_engine_migrateds do |t|
      t.string :original_version
      t.string :migrated_version
      t.belongs_to :integra_engine

      t.timestamps
    end
    add_index :integra_engine_migrateds, :integra_engine_id
  end
end
