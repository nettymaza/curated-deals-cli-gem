require 'pry'
require 'nokogiri'
require 'open-uri'

module CuratedDeals
  class Scraper

    def get_page(url_to_scrape)
      Nokogiri::HTML(open(url_to_scrape))
    end

  end
end
