class Recipe < ApplicationRecord
  before_validation :fetch_recipe_info, if: :original_url_changed?

  private

  def fetch_recipe_info 
    doc = Nokogiri::HTML(URI.open(original_url))
    self.title = doc.at_css('title').text.strip
    self.image_url = doc.at_css('meta[property="og:image"]')&.[]('content') || doc.at_css('meta[name="twitter:image"]')&.[]('content')
    self.description_url = doc.at_css('meta[property="og:description"]')&.[]('content') || doc.at_css('meta[name="twitter:description"]')&.[]('content')
  rescue StandardError => e
    errors.add(:original_url, "URLから情報を取得できませんでした: #{e.message}")
  end
end