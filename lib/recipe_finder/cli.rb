# CLI Controller
class RecipeFinder::CLI

  BASE_PATH = "https://www.allrecipes.com/"

  def call
    hello
    make_categories
    main_menu
  end

  def hello
    puts "\nHi! Welcome to Command Line Recipe Finder.".colorize(:cyan)
  end

  def make_categories
    category_array = RecipeFinder::Scraper.scrape_categories(BASE_PATH)
    RecipeFinder::Category.create_from_collection(category_array)
  end

  def main_menu
    puts "\nWelcome to the Main Menu!".colorize(:cyan)
    puts "#{"I accept:".colorize(:cyan)} #{"help".colorize(:yellow)}, #{"cook".colorize(:light_green)}, #{"list".colorize(:light_magenta)}, and #{"quit".colorize(:red)}."
    puts "What would you like to do?".colorize(:yellow)
    input = gets.strip.downcase

    case input
    when "help"
      help
    when "cook"
      cook_category
    when "list"
      list_categories
    when "quit"
      quit
    else
      puts "I'm sorry, I don't know that command.".colorize(:light_red)
      main_menu
    end
  end

  def help
    puts "\nMain Menu Commands:".colorize(:cyan)
    puts "  help".colorize(:yellow) + " - Brings up this dialog."
    puts "  cook".colorize(:light_green) + " - Will prompt for a category and find recipes from that category."
    puts "  list".colorize(:light_magenta) + " - Will list all the recipe categories."
    puts "  quit".colorize(:red) + " - Will exit this program."
    main_menu
  end

  def list_categories
    RecipeFinder::Category.list
    main_menu
  end

  def cook_category
    puts "\nPlease enter the category number you'd like to search:".colorize(:yellow)
    input = gets.strip
    if input.to_i.between?(1, RecipeFinder::Category.count)
      category = RecipeFinder::Category.find_by_index(input.to_i)
      category.list_recipes
      menu2(category)
    elsif input.downcase == "back"
      puts "Returning to Returning to Main Menu".colorize(:light_red)
      main_menu
    elsif input.downcase == "quit"
      quit
    else
      puts "Sorry, invalid entry. Please enter a valid category number from the list or enter 'back'.".colorize(:light_red)
      cook_category
    end
  end

  def quit
    puts "\nSee you later for more recipe finding!!!".colorize(:cyan)
  end

  def menu2(category)
    puts "\nYou are currently in the #{category.name} Category.".colorize(:cyan)
    puts "#{"I accept:".colorize(:cyan)} #{"help".colorize(:yellow)}, #{"cook".colorize(:light_green)}, #{"list".colorize(:light_magenta)}, #{"back".colorize(:light_blue)}, and #{"quit".colorize(:red)}."
    puts "What would you like to do?".colorize(:yellow)
    input = gets.strip.downcase

    case input
    when "help"
      help2(category)
    when "cook"
      cook_recipe(category)
    when "list"
      list_recipes(category)
    when "back"
      list_categories
    when "quit"
      quit
    else
      puts "I'm sorry, I don't know that command.".colorize(:light_red)
      menu2(category)
    end
  end

  def help2(category)
    puts "\n#{category.name} Menu Commands:".colorize(:cyan)
    puts "  help".colorize(:yellow) + " - Brings up this dialog."
    puts "  cook".colorize(:light_green) + " - Will prompt for a recipe and return information about that recipe."
    puts "  list".colorize(:light_magenta) + " - Will list all the recipes in #{category.name} category."
    puts "  back".colorize(:light_blue) + " - Will list all the recipe categories and bring you back to the main menu."
    puts "  quit".colorize(:red) + " - Will exit this program."
    menu2(category)
  end

  def cook_recipe(category)
    puts "\nWhich recipe number would you like to know how to make?".colorize(:yellow)
    input = gets.strip
    # check if input in range
    if input.to_i.between?(1, category.recipe_count)
      recipe = category.find_recipe_by_index(input.to_i)
      recipe.display
      puts "\nWould you like to open in browser [y/N]?".colorize(:yellow)
      input2 = gets.strip.downcase
      recipe.open_in_browser if ['y', 'yes'].include?(input2)
      menu2(category)
    elsif input.downcase == "back"
      puts "Returning to #{category.name} Menu.".colorize(:light_red)
      menu2(category)
    elsif input.downcase == "quit"
      quit
    else
      puts "Sorry, invalid entry. Please enter a valid recipe number from the list or enter 'back'.".colorize(:light_red)
      cook_recipe(category)
    end
  end

  def list_recipes(category)
    category.list_recipes
    menu2(category)
  end

end
