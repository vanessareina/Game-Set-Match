class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :level, null: false
      t.text :description
      t.string :city, null: false
      t.string :state, null: false
      t.string :preference, null: false
      t.string :time, null: false
      t.string :date, null: false

      t.timestamps null: false
    end
  end
end
