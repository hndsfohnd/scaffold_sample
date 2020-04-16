class RemoveColumnsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :Books, :author_id, :bigint
  end
end
