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
    # starts index at 1
    @categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the recipe category you'd like more info on or type 'list' to see the categories again or type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        the_category = @categories[input.to_i - 1]
        puts "DETAILS #{the_category.name}"
      elsif input == "list"
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
