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

  def self.list
    self.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  # instance method because you list recipes belonging to an instance
  def list_recipes
    # check if recipes have been retrieved yet
    # if not, retrieve them first; else list them
    if self.recipes == []
      self.retrieve_recipes
    end
    self.recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  # def get_recipes
  #   # Should check if recipes already exist, and if not scrape the page for recipes
  #   # scrape the category page on the website to find the top 4 most made today recipes
  #   RecipeFinder::Scrape.scrape_recipes
  # end

  def retrieve_recipes
    recipes = RecipeFinder::Scraper.scrape_recipes
    recipes.each{|recipe| self.recipes << recipe}
  end

  def self.find_by_index(index)
    self.all.detect{|category| category.index == index}
  end

  def find_recipe_by_index(index)
    self.recipes.detect{|recipe| recipe.index == index}
  end

  # def add_student_attributes(attributes_hash)
  #   attributes_hash.each{|k, v| self.send("#{k}=", v)}
  # end


end
