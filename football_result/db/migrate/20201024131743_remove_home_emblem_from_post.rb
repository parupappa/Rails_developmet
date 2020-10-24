class RemoveHomeEmblemFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :home_emblem, :text
  end
end
