class AddColumnToAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :short_title, :string
    add_column :animes, :title_yomi, :string
  end
end
