require 'pry'
require 'nokogiri'
require 'open-uri'

class CuratedDeals::Scraper

  def get_page
    Nokogiri::HTML(open('https://canopy.co/shop/categories'))
  end


end
