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

  end

  #list_categories by index

end
