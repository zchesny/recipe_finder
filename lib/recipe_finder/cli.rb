# Our CLI Controller

# color options
# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
class RecipeFinder::CLI

  BASE_PATH = "https://www.allrecipes.com/"

  def call
    make_categories
    list_categories
    menu
    goodbye
  end

  def make_categories
    category_array = RecipeFinder::Scraper.scrape_categories(BASE_PATH)
    RecipeFinder::Category.create_from_collection(category_array)
  end

  def list_categories
    puts "Categories:"
    RecipeFinder::Category.list
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the recipe category you'd like more info on or type 'list' to see the categories again or type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        category = RecipeFinder::Category.find_by_index(input.to_i)
        # print recipes from the category
        puts "Most Made Today Recipes for #{category.name}:"
        category.list_recipes
        recipe_menu(category)
      elsif input == "list"
        list_categories
      else
        puts "Not sure what you want, type 'list' or 'exit'"
      end

    end
  end

  def recipe_menu(category)
    input = nil
    while input != "exit"
      puts "\n Enter the number of the recipe you'd like to know more about or type 'exit' or type 'categories' to see the categories again or type 'recipes' to see the recipes again"
      input = gets.strip.downcase

      if input.to_i > 0
        recipe = category.find_recipe_by_index(input.to_i)
        # If recipe has all the attributes, display it; else retrieve attributes 
        recipe.display
      elsif input == "recipes"
        category.list_recipes
      elsif input == "categories"
        menu
      else
        puts "Not sure what you want, type 'categories', 'recipes', or 'exit'"
      end

    end
  end

  def goodbye
    puts "See you tomorrow for more recipes!!!"
  end
end
