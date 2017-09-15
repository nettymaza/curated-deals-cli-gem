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

    def get_input
      input = gets.strip

      if (1..10).to_a.include?(input.to_i)
        return input.to_i
      elsif ['start', 'exit'].include?(input)
        case input
        when "start"
          start
        when "exit"
          puts 'Goodbye!'
          exit
        end
      else
        puts "Invalid input, try again or type start to start over."
        get_input
      end
    end

    def choose_category
      puts "Which category of products would you like to see? Type a number..."
      input = get_input
      @category = Category.get_by_index(input.to_i - 1)
      @category.display_category

      choose_product
    end

    def choose_product
      puts "Which product would you like to buy on Amazon? Type a number..."
      @category.list_products
      puts "Not sure? Type start to view categories again! "
      puts "Not interested? To quit, type exit"
      input = get_input

      @category.products[input.to_i - 1].buy_on_amazon
    end
  end
end
