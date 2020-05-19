class CreateAyets < ActiveRecord::Migration[6.0]
  def change
    create_table :ayets do |t|
      t.belongs_to :chapter, index: true, foreign_key: { on_delete: :cascade }
      t.integer :ayet_number, limit: 2, index: true
      t.string :content, limit: 3000
      t.text :note
      t.string :slug, index: { unique: true }
      t.timestamps
    end
  end
end
