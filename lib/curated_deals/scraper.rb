require 'pry'
require 'nokogiri'
require 'open-uri'

class CuratedDeals::Scraper

  def get_page(url_to_scrape)
    Nokogiri::HTML(open(url_to_scrape))
  end


end
