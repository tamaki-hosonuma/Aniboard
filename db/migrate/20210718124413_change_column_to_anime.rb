class ChangeColumnToAnime < ActiveRecord::Migration[6.0]
  def change
   change_column :animes, :short_title, :string, default: ''
   change_column :animes, :title_yomi, :string, default: ''
  end
end