#CLI controller
module CuratedDeals
  class CLI
    def call
      greeting
      start
    end

    def greeting
      puts "Welcome to Curated Deals!"
      puts "Curated Deals features beautiful and functional products, curated by a community with great taste."
    end

    def start
      Category.get_categories
      Category.list_categories
      choose_category
    end

    def choose_category
      puts "Which category of products would you like to see? Type a number..."
      input = gets.strip
      @category = Category.get_by_index(input.to_i - 1)
      @category.display_category
      choose_product
    end

    def choose_product
      puts "Which product would you like to buy on amazon?"
      @category.list_products
      input = gets.strip
      @category.products[input.to_i - 1].buy_on_amazon
    end
  end
end
