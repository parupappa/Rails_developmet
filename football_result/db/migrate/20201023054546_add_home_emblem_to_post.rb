class AddHomeEmblemToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :home_emblem, :text
  end
end
