class ChangeColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :rate, :float, null: false, default: 0
  end
end
