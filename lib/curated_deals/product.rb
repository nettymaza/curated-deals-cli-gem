require 'launchy'

module CuratedDeals
  class Product
    attr_accessor :name, :price, :category

    def initialize(name, price, category, amazon_url)
      @name = name
      @category = category
      @price = price
      @amazon_url = amazon_url
    end

    def buy_on_amazon
      Launchy.open(@amazon_url)
    end
  end
end
