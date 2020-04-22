class RecipeFinder::Recipe

  attr_accessor :name, :author, :rating, :ingredients, :directions, :url, :index

  @@all = []

  def initialize(recipe_hash)
    recipe_hash.each{|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end

  def self.create_from_collection(recipe_array)
    recipe_array.map{|recipe_hash| self.new(recipe_hash)}
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  # def retrieve_recipes
  #   recipes = RecipeFinder::Scraper.scrape_recipes
  #   recipes.each{|recipe| self.recipes << recipe}
  # end
  #
  # def self.find_by_index(index)
  #   self.all.detect{|category| category.index == index}
  # end
  #
  # def find_recipe_by_index(index)
  #   self.recipes.detect{|recipe| recipe.index == index}
  # end

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
