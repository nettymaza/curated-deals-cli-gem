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
    def get_products(url_to_scrape)
      browser = Watir::Browser.new :chrome
      browser.goto url_to_scrape
      Watir::Wait.until { browser.divs(:class => "feed-card").length > 0 }
      webpage = Nokogiri::HTML(browser.html)
    end
  end
end
