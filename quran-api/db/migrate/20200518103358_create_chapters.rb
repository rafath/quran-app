class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :name, null: false
      t.string :pl_name, null: false
      t.integer :chapter_number, limit: 2, null: false
      t.integer :ayets_quantity, limit: 2, null: false
      t.text :history
      t.string :slug, index: { unique: true }
      t.timestamps
    end
  end
end

