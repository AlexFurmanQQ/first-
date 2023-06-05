class CreatePostComents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_coments do |t|
      t.string :message
      t.belongs_to :post, foreign_key: true
      t.timestamps
    end
  end
end
