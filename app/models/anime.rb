class Anime < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  has_one :anime_detail
  enum season: { spring: 1, summer: 2, autumn: 3, winter: 4 }

  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end

  def import_from_annict
    base_url = "https://api.annict.com/v1"
    access_token = ENV["ANNICT_ACCESS_TOKEN"]

    start_year = 1980
    end_year = Date.today.year
    seasons = ["spring", "summer", "autumn", "winter"]

    (start_year..end_year).each do |year|
      seasons.each.with_index(1) do |season, index|
        data = JSON.parse(Faraday.get("#{base_url}/works?fields=id&per_page=50&filter_season=#{year}-#{season}&sort_watchers_count=desc&access_token=#{access_token}").body)

        data_count = data["total_count"]
        page_count = (data_count / 50.to_f).ceil
        current_page = 1

        while current_page <= page_count
          data = JSON.parse(Faraday.get("#{base_url}/works?fields=title,images,twitter_username,official_site_url,media_text,syobocal_tid,season_name_text&page=#{current_page}&per_page=50&filter_season=#{year}-#{season}&sort_watchers_count=desc&access_token=#{access_token}").body)
          works = data["works"]

          works.each do |work|
            Anime.find_or_initialize_by(title: work["title"]).update(
              year: year,
              season: index,
              image: work["images"]["recommended_url"],
              twitter_username: work["twitter_username"],
              official_site_url: work["official_site_url"],
              media_text: work["media_text"],
              syobocal_tid: work["syobocal_tid"],
              season_name_text: work["season_name_text"]
            )
          end
          current_page += 1
        end
      end
    end
  end
end
