class CuratedDeals::Category
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  #Get category names and urls
  def self.get_categories
  end

  #list_categories by index

end
