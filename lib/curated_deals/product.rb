require 'launchy'


  class CuratedDeals::Product
    attr_accessor :name, :price, :category

    @@all = []

    def initialize(name, price, category, amazon_url)
      @name = name
      @category = category
      @price = price
      @amazon_url = amazon_url
      @@all << self
    end

    def self.all
      @@all
    end

    def buy_on_amazon
      Launchy.open(@amazon_url)
    end

    def self.price_greater_than(number)
      products = []

      @@all.each do |product|
        if product.price.gsub(/\D/, '').to_i > number
          products << product
        end
      end

      return products
    end

  end
