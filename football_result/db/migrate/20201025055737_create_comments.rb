class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.text :content

      t.timestamps
      t.index :post_id
    end
  end
end
