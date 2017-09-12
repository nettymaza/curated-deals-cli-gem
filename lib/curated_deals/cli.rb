#CLI controller
class CuratedDeals::CLI

    def call
      puts "Which category of products would you like to see?"
      Category.get_categories
    end

  end
end

# greet
# intro
# menu
# list categories by index
# display chosen category
# list products within chosen category
# list chosen product
