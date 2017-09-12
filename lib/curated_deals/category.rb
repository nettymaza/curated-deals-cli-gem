module CuratedDeals
  class Category
    attr_accessor :name, :products_list_url, :products
    @@all = []

    def initialize(name, products_list_url)
      @name = name
      @products_list_url = products_list_url
      @products = []
      @@all << self
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
      categories_page.css(".CollectionGrid-tile").map do |category|
        name = category.css(".CollectionGrid-tileName").text.gsub(/\n/, '')
        products_list_url = "https://canopy.co" + category.attr('href')
        self.new(name, products_list_url)
        binding.pry
      end
    end

    def self.list_categories
      @@all[0..5].each_with_index do |category, index|
      end
    end

    #display category name

    #A category has many products
  end
end
