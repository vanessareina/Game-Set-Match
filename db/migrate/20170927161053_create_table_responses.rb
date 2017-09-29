class CreateTableResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
    end
  end
end
