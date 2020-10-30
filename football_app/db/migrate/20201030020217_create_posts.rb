class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :person_id
      t.string :hometeam
      t.string :awayteam
      t.string :date
      t.integer :hr
      t.integer :ar
      t.string :mymom
      t.text :memo

      t.timestamps
    end
  end
end
