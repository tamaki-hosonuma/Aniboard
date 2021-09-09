require 'syobocal'
require 'pp'

anime_dbs = Syobocal::DB::TitleLookup.get('TID' => '*', 'Fields' => 'Title')

anime_dbs.each do |anime_db|
  animes = anime_db.values_at(:title)
  anime_title = animes[0]
  Anime.create!(title: anime_title)
end