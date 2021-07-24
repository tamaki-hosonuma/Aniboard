class AddColumnToPosts3 < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foreign_key: true
    add_reference :posts, :anime, foreign_key: true
  end
end
