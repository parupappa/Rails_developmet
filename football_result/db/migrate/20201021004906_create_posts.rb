class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :hometeam
      t.text :awayteam
      t.integer :hr
      t.integer :ar

      t.timestamps
    end
  end
end
