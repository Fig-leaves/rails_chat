class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :content
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
