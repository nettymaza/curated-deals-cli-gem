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
      end
    end

    #Display categories by index
    def self.list_categories
      @@all[0..7].each_with_index do |category, index|
        puts "#{index + 1}. #{category.name}"
        # binding.pry
      end
    end

    def self.get_by_index(index)
      @@all[index]
    end

    #Display chosen category
    def display_category
      puts @name
    end
    # binding.pry
    #A category has many products
  end
end
