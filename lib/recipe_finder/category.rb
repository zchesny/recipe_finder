class RecipeFinder::Category

  attr_accessor :name, :recipes, :url

  def self.list
    # I should return a list of recipe categories
    # here doc - giant strings
    puts <<-DOC.gsub /^\s*/, ''
      1. Quarantine Cooking
      2. Appetizers and Snacks
      ...
      10. Slow Cooker Recipes
      11. Soups, Stews, and Chili
    DOC
    category_1 = self.new
    category_1.name = "Quarantine Cooking"
    category_1.recipes = [] # keep as empty array until chosen, and then populate
    category_1.url = "fakeurl"

    category_2 = self.new
    category_2.name = "Apetizers and Snacks"
    category_2.recipes = []
    category_2.url = "fakeurl"

    [category_1, category_2]
  end

end
