class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.integer :view
      t.datetime :publication_date 
      t.boolean :is_deleted, :default => false
      t.timestamps
    end
  end
end
