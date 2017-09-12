require 'pry'
require 'nokogiri'
require 'open-uri'
require 'watir'

module CuratedDeals
  class Scraper

    def get_page(url_to_scrape)
      Nokogiri::HTML(open(url_to_scrape))
    end
  
    #This will fully load a page, using a browser instance and excecute JavaScript.
    def get_fully_loaded_page(url_to_scrape)
      browser = Watir::Browser.new
      browser.goto url_to_scrape
      Nokogiri::HTML.parse(browser.html)
    end


  end
end
