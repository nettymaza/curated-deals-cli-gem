
  class CuratedDeals::Category
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

    #belongs in CLI
    def self.list_categories
      @@all[0..9].each_with_index do |category, index|
        puts "#{index + 1}. #{category.name}"
      end
    end

    def self.get_by_index(index)
      @@all[index]
    end


    #belongs in CLI
    def display_category
      puts "#{name} is a great choice!"
      fetch_products
    end

    #belongs in scraper
    def fetch_products
      puts "Fetching products from #{@products_list_url}"
      @products.clear
      products = CuratedDeals::Scraper.new.get_products(@products_list_url)
      products.css(".product-card").each do |product|
        product_name = product.css(".product-details-name span").text
        product_price = product.css(".buy-button-container span").text
        amazon_url = product.css(".buy-button-container a").attr('href').value
        product = CuratedDeals::Product.new(product_name, product_price, self, amazon_url)
        @products << product
      end
    end

    #belongs in CLI
    def list_products
      @products[0..9].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
    end
  end
