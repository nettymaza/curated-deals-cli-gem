module CuratedDeals
  class Category
    attr_accessor :name, :products, :products_list_url
    @@all = []

    def initialize(name, products_list_url)
      @name = name
      @products_list_url = products_list_url
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
      end
      end

    def self.create_by_name(name, products_list_url)
      category = self.new(name)
      category.save
      category
      binding.pry
    end

    #make a category

    #list_categories by index

    #display category name

    #A category has many products
  end
end
