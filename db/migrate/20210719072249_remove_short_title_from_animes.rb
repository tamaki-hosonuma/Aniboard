class RemoveShortTitleFromAnimes < ActiveRecord::Migration[6.0]
  def change
    remove_column :animes, :short_title, :string
    remove_column :animes, :title_yomi, :string
  end
end
