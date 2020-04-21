# Our CLI Controller
class RecipeFinder::CLI

  def call
    list_recipe_categories
    menu
    goodbye
  end

  def list_recipe_categories
    puts "Today's Recipes:"
    # get recipe categories
    @categories = RecipeFinder::Category.list
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the recipe category you'd like more info on or type 'list' to see the categories again or type 'exit':"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on Quarantine Cooking..."
      when "2"
        puts "More info on Appetizers and Snacks... "
      when "list"
        list_recipe_categories
      else
        puts "Not sure what you want, type 'list' or 'exit'"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more recipes!!!"
  end
end
