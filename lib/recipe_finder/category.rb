class RecipeFinder::Category

  attr_accessor :name, :url, :recipes

  @@all = []

  def self.list
    # I should return a list of recipe categories
    # here doc - giant strings
    # scrape allrecipes and then return categories based on that data
    self.create_categories
    #RecipeFinder::Scraper.new.categories
  end


  def self.create_categories
    category_1 = self.new
    category_1.name = "Quarantine Cooking"
    category_1.recipes = [] # keep as empty array until chosen, and then populate
    category_1.url = "fakeurl"

    category_2 = self.new
    category_2.name = "Appetizers and Snacks"
    category_2.recipes = []
    category_2.url = "fakeurl"

    [category_1, category_2]
  end


  # def initialize(category_hash)
  #   category_hash.each{|k, v| self.send("#{k}=", v)}
  #   self.class.all << self
  # end

  def self.create_from_collection(category_array)
    category_array.each{|category_hash| Catgory.new(category_hash)}
  end

  def add_recipes(recipes)
  end

  def self.all
    @@all
  end

  # def add_student_attributes(attributes_hash)
  #   attributes_hash.each{|k, v| self.send("#{k}=", v)}
  # end


end
