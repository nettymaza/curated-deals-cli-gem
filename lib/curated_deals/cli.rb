#CLI controller
module CuratedDeals
  class CLI

    def call
      puts "Which category of products would you like to see?"
      Category.get_categories
      Category.display_categories
      # greet
      # intro
      # list_categories

      # list_items from chosen category

      # goodbye
    end

  end
end
