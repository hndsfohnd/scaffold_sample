class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :description,           null: false
      t.string :amadeus,               null: false
      t.string :axess
      t.string :infini
      t.timestamps
    end
  end
end
