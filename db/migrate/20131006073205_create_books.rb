class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.datetime :published_at
      t.integer :publisher_id

      t.timestamps
    end
  end
end
