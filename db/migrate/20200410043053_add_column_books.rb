class AddColumnBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :question, :string
    add_column :books, :answer, :string
  end
end
