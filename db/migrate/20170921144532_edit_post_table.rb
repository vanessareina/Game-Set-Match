class EditPostTable < ActiveRecord::Migration[5.0]
  def change
    change_table :posts do |t|
      t.rename :name, :title
      t.rename :description, :comments
      t.string :age_group, null: false
      t.string :gender, null: false
    end
  end
end
