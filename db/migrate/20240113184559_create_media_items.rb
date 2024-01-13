class CreateMediaItems < ActiveRecord::Migration[7.1]
  def change
    create_table :media_items do |t|
      t.float :x
      t.float :y
      t.float :z
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
