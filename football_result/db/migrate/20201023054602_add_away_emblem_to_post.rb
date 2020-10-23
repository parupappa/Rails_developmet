class AddAwayEmblemToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :away_emblem, :text
  end
end
