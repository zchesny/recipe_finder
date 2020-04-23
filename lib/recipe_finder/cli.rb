# Our CLI Controller

# color options
# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :cyan, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
class RecipeFinder::CLI

  BASE_PATH = "https://www.allrecipes.com/"

  def call
    hello
    make_categories
    main_menu
  end

  def hello
    puts "Hi! Welcome to Command Line Recipe Finder.".colorize(:cyan)
  end

  def make_categories
    category_array = RecipeFinder::Scraper.scrape_categories(BASE_PATH)
    RecipeFinder::Category.create_from_collection(category_array)
  end

  def main_menu
    puts "\nWelcome to the Main Menu!".colorize(:cyan)
    puts "I accept: help, search, categories, and quit.".colorize(:cyan)
    puts "What would you like to do?".colorize(:yellow)
    input = gets.strip.downcase

    case input
    when "help"
      help
    when "search"
      search
    when "categories"
      categories
    when quit
      quit
    else
      puts "I'm sorry, I don't know that command.".colorize(:light_red)
      main_menu
    end
  end

  def quit
    puts "\nSee you later for more recipe finding!!!".colorize(:cyan)
  end

  def categories
    RecipeFinder::Category.list
    main_menu
  end

  def help
    puts "Main Menu Commands:".colorize(:cyan)
    puts "  help".colorize(:yellow) + " - Brings up this dialog"
    puts "  search".colorize(:light_green) + " - Will prompt for a category and find recipes from that category"
    puts "  categories".colorize(:cyan) + " - Will list all the recipe categories"
    puts "  quit".colorize(:red) + " - Will exit this program."
    main_menu
  end

  def search
    puts "\nPlease enter the category number you'd like to search:".colorize(:yellow)
    input = gets.strip
    if input.to_i > 0
      category = RecipeFinder::Category.find_by_index(input.to_i)
      category.list_recipes
      menu2(category)
    else
      puts "Sorry, invalid entry. Returning to Main Menu.".colorize(:light_red)
      main_menu
    end
  end

  def menu2(category)
    puts "\nYou are currently in the #{category.name} Category.".colorize(:cyan)
    puts "I accept: help, recipe, recipes, categories, and quit.".colorize(:cyan)
    puts "What would you like to do?".colorize(:yellow)
    input = gets.strip.downcase

    case input
    when "help"
      help2(category)
    when "recipe"
      recipe(category)
    when "recipes"
      recipes(category)
    when "categories"
      categories
    when "quit"
      quit
    else
      puts "I'm sorry, I don't know that command.".colorize(:light_red)
      menu2(category)
    end
  end


  def recipes(category)
    category.list_recipes
    menu2(category)
  end

  def recipe(category)
    puts "\nWhich recipe number would you like to know how to make?".colorize(:yellow)
    input = gets.strip
    if input.to_i > 0
      recipe = category.find_recipe_by_index(input.to_i)
      recipe.display
      menu2(category)
    else
      puts "Sorry, invalid entry. Returning to #{cateogry.name} Menu.".colorize(:light_red)
      menu2(category)
    end
  end

  def help2(category)
    puts "#{category.name} Menu Commands:".colorize(:cyan)
    puts "  help".colorize(:yellow) + " - Brings up this dialog"
    puts "  recipe".colorize(:light_green) + " - Will prompt for a recipe and return information about that recipe"
    puts "  recipes".colorize(:light_magenta) + " - Will list all the recipes in this category"
    puts "  categories".colorize(:cyan) + " - Will list all the recipe categories and bring you back to the main menu"
    puts "  quit".colorize(:red) + " - Will exit this program."
    menu2(category)
  end

end
