class AddColumnsToAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :year, :integer
    add_column :animes, :season, :integer
    add_column :animes, :image, :string
    add_column :animes, :twitter_username, :string
    add_column :animes, :official_site_url, :string
    add_column :animes, :media_text, :string
    add_column :animes, :season_name_text, :string
    add_column :animes, :syobocal_tid, :string
  end
end
