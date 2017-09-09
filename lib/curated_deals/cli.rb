#CLI controller
class CuratedDeals::CLI

  def call
    puts "Your Curated Items:"
    # greet
    # intro
    # list_categories
    list_items from chosen category
    goodbye
  end

  def list_categories
    #Case or if statement
    1.Trending
    2.New
    3.Most Popular
  end



  def trending_items
    #List current trendig curated items
  end

  def new_items
    #List all new curated items
  end

  def most_popular_items
    #List most popular curated items
  end

  #Notes

  #Items
  #Have a name
  #Have an image
  #Have a description
  #Have a price
  #Have availability
  #Have a link

  #Items will be stored in an array or object?



end
