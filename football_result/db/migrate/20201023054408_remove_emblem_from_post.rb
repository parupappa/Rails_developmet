class RemoveEmblemFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :emblem, :text
  end
end
