class RecipeFinder::Recipe

  attr_accessor :name, :author, :rating, :ingredients, :directions, :url, :index

  def self.list
    recipe = Recipe.new
    recipe.name = "Tacos"
    recipe.author = "Zoey"
    recipe.rating = "5"
    recipe.ingredients = "Taco Shells, Beef, Cheese"
    recipe.directions = "Combine Ingredients onto Taco Shells and Serve"
    recipe.url = "www.allrecipes.com"
  end

  def display
    puts "#{self.name.upcase}".colorize(:blue)
    puts "  author:".colorize(:light_blue) + " #{self.author}"
    puts "  rating:".colorize(:light_blue) + " #{self.rating}"
    puts "  ingredients:".colorize(:light_blue) + " #{self.ingredients}"
    puts "  directions:".colorize(:light_blue) + " #{self.directions}"
    puts "  url:".colorize(:light_blue) + " #{self.url}"
    puts "----------------------".colorize(:green)
  end

end
