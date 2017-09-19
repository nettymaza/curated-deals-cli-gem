require 'pry'
require 'nokogiri'
require 'open-uri'
require 'watir'

  class CuratedDeals::Scraper

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

    def get_categories
      categories_page = get_page('https://canopy.co/shop/categories')
      categories_page.css(".CollectionGrid-tile").map do |category|
        name = category.css(".CollectionGrid-tileName").text.gsub(/\n/, '')
        products_list_url = "https://canopy.co" + category.attr('href')
        CuratedDeals::Category.new(name, products_list_url)
      end
    end
  end
