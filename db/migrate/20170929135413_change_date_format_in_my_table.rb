class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :date, 'date USING CAST(date as date)'
  end
end
