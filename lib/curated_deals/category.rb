class CuratedDeals::Category
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
      name = category.css(".CollectionGrid-tileName").text
      products_list_url = category.attr('href')
    end
  end

  #list_categories by index

  #display category name

  #A category has many products

end
