class RemoveColumnsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :books, :authors
    remove_index :books, :author_id
    remove_reference :books, :author
  end
end
