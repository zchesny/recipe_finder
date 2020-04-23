class RecipeFinder::Recipe

  attr_accessor :name, :author, :rating, :description, :ingredients, :directions, :nutrition, :url, :index, :loaded

  @@all = []

  def initialize(recipe_hash)
    recipe_hash.each{|k, v| self.send("#{k}=", v)}
    @loaded = false
    self.class.all << self
  end

  def self.create_from_collection(recipe_array)
    recipe_array.map{|recipe_hash| self.new(recipe_hash)}
  end

  def add_recipe_attributes
    attributes_hash = RecipeFinder::Scraper.scrape_recipe(self.url)
    attributes_hash.each{|k, v| self.send("#{k}=", v)}
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  def display
    # check if loaded, if not load and display
    self.add_recipe_attributes if !loaded
    if !loaded
      puts "\n----------------------".colorize(:light_green)
      puts "#{self.name.upcase}".colorize(:cyan)
      puts "  rating: ".colorize(:light_magenta) + "#{self.rating}"
      puts "Sorry, I was unable to load this recipe's additional information.".colorize(:red)
      puts "You can visit the website below for full details".colorize(:red)
      puts "  url: ".colorize(:light_magenta) + "#{self.url}"
      puts "----------------------".colorize(:light_green)
    else
      puts "\n----------------------".colorize(:light_green)
      puts "#{self.name.upcase}".colorize(:cyan)
      puts "  author: ".colorize(:light_magenta) + "#{self.author}"
      puts "  rating: ".colorize(:light_magenta) + "#{self.rating}"
      puts "  description: ".colorize(:light_magenta) + "#{self.description}"
      puts "  ingredients:".colorize(:yellow)
      self.ingredients.each{|ing| puts "    - ".colorize(:yellow) + "#{ing}"}
      puts "  directions:".colorize(:light_green)
      self.directions.each.with_index(1) do |dir, i|
        puts "    #{i}. ".colorize(:light_green) + "#{dir}" if dir != ""
      end
      puts "  nutrition facts (per serving): ".colorize(:light_magenta) + "#{self.nutrition}"
      puts "  url: ".colorize(:light_magenta) + "#{self.url}"
      puts "----------------------".colorize(:light_green)
    end
  end

end
