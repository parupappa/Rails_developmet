class RemoveAwayEmblemFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :away_emblem, :text
  end
end
