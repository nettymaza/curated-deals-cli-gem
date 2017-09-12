module CuratedDeals
  class Product
    attr_accessor :name, :category

    def initialize(name, category = nil)
      @name = name
      self.category = category if category
    end
    #fetch products
    #products belong to a category
    #generate products by category
    #display products by category
  end
end
