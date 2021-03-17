class CreateAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :analytics do |t|
      t.integer :chapter_id, limit: 2
      t.string :ip, limit: 32
      t.integer :played_ayet_id, limit: 2
      t.timestamps
    end
  end
end
