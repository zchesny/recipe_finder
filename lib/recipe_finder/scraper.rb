class RecipeFinder::Scraper

  # returns an array of hashes for each category
  def self.scrape_categories(base_url)
    doc = Nokogiri::HTML(open(base_url))
    i = 0
    doc.css(".grid-col--subnav").map do |el|
      i += 1
      {name: el.css("span.category-title").text,
        url: el.attr("href"),
        recipes: [],
        index: i}
    end
  end

  def self.scrape_recipes2(category_url = "lol")
    doc = Nokogiri::HTML(open("https://www.allrecipes.com/recipes/76/appetizers-and-snacks/?internalSource=top%20hubs&referringContentType=Homepage"))
    recipes = []
    doc.css("ol.list-recipes__carousel").css("li").each.with_index(1) do |el, i|
      if el.search("a").attr("href") == nil
        break
      end
      recipes << {name: el.search("h3").text.strip,
        url: el.search("a").attr("href").value,
        index: i}
    end
    recipes
    binding.pry
  end

  # returns an array of hashes for each recipe
  # for now, it has fake data and already returns recipe objects
  def self.scrape_recipes(category_url="lol")
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



  def self.scrape_recipe(recipe_url)
  end


end
