class RecipeFinder::Category

  attr_accessor :name, :url, :recipes, :index

  @@all = []

  def initialize(category_hash)
    category_hash.each{|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end

  def self.create_from_collection(category_array)
    category_array.each{|category_hash| self.new(category_hash)}
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def recipe_count
    self.recipes.size
  end

  def self.list
    puts "\nCategories List:".colorize(:light_magenta)
    puts "----------------------".colorize(:light_magenta)
    self.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}".colorize(:light_magenta)
    end
  end

  def self.find_by_index(index)
    self.all.detect{|category| category.index == index}
  end

  def list_recipes
    self.get_recipes if self.recipes == []
    puts "\nRecipes for #{self.name}: ".colorize(:light_green)
    puts "----------------------".colorize(:light_green)
    self.recipes.sort_by{|r| r.name}.each.with_index(1) do |recipe, i| 
      recipe.index = i 
      puts "#{i}. #{recipe.name}".colorize(:light_green)
    end
  end

  def find_recipe_by_index(index)
    self.recipes.detect{|recipe| recipe.index == index}
  end

  def get_recipes
    recipe_hash_array = RecipeFinder::Scraper.scrape_recipes(self.url)
    recipe_array = RecipeFinder::Recipe.create_from_collection(recipe_hash_array)
    recipe_array.each{|recipe| self.recipes << recipe}
  end

end
