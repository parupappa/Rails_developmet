class AddEmblemToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :emblem, :text
  end
end
