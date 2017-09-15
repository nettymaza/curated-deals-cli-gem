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
        # binding.pry
      end
    end

    #Display categories by index
    def self.list_categories
      @@all[0..9].each_with_index do |category, index|
        puts "#{index + 1}. #{category.name}"
        # binding.pry
      end
    end

    def self.get_by_index(index)
      @@all[index]
    end

    #Display chosen category
    def display_category
      puts "#{name} is a great choice!"
      fetch_products
    end

    #A category has many products
    #fetch products by category
    #list products

    def fetch_products
      puts "Fetching products from #{@products_list_url}"
      @products.clear
      products = Scraper.new.get_products(@products_list_url)
      products.css(".product-card").each do |product|
        product_name = product.css(".product-details-name span").text
        product_price = product.css(".buy-button-container span").text
        amazon_url = product.css(".buy-button-container a").attr('href').value
        product = Product.new(product_name, product_price, self, amazon_url)
        @products << product
      end
    end

    def list_products
      @products[0..9].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
    end
  end
end
