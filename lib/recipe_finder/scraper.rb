class RecipeFinder::Scraper

  # returns an array of hashes for each category
  def self.scrape_categories(website)
    doc = Nokogiri::HTML(open(website))
    i = 0
    doc.css(".grid-col--subnav").map do |el|
      i += 1
      {name: el.css("span.category-title").text,
      url: el.attr("href"),
      recipes: [],
      index: i}
    end
  end

  # returns an array of hashes for each recipe
  # for now, it has fake data and already returns recipe objects
  def self.scrape_recipes
    recipe1 = RecipeFinder::Recipe.new
    recipe1.name = "Tacos"
    recipe1.author = "Zoey"
    recipe1.rating = "5"
    recipe1.ingredients = "Taco Shells, Beef, Cheese"
    recipe1.directions = "Combine Ingredients onto Taco Shells and Serve"
    recipe1.index = 1
    recipe1.url = "www.allrecipes.com"

    recipe2 = RecipeFinder::Recipe.new
    recipe2.name = "Tacos2"
    recipe2.author = "Zoey2"
    recipe2.rating = "4.5"
    recipe2.ingredients = "Taco Shells, Beef, Cheese2"
    recipe2.directions = "Combine Ingredients onto Taco Shells and Serve2"
    recipe2.index = 2 
    recipe2.url = "www.allrecipes.com2"

    [recipe1, recipe2]
  end


end
