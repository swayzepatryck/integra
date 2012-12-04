class CreateIntegraNewsMessages < ActiveRecord::Migration
  def change
    create_table :integra_news_messages do |t|
      t.belongs_to :category
      t.belongs_to :user
      t.string :title
      t.text :message_text

      t.timestamps
    end
    add_index :integra_news_messages, :category_id
    add_index :integra_news_messages, :user_id
  end
end
