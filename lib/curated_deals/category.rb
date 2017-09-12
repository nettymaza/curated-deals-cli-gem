module CuratedDeals
  class Category
    attr_accessor :name, :products
    @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @products = []
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    #Get category names and urls
    def self.get_categories
      categories_page = Scraper.new.get_page('https://canopy.co/shop/categories')
      categories_page.css(".CollectionGrid-tile").each do |category|
        name = category.css(".CollectionGrid-tileName").text.gsub(/\n/, '')
        products_list_url = "https://canopy.co" + category.attr('href')
        binding.pry
      end
      end


    #make a category form category array

    #list_categories by index

    #display category name

    #A category has many products
  end
end
