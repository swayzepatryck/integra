class CreateIntegraNewsCategories < ActiveRecord::Migration
  def change
    create_table :integra_news_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
