class RecipeFinder::Scraper

  # returns an array of hashes for each category
  def self.scrape_categories(base_url)
    doc = Nokogiri::HTML(open(base_url))
    doc.css(".grid-col--subnav").map.with_index(1) do |el, i|
      {name: el.css("span.category-title").text,
        url: el.attr("href"),
        recipes: [],
        index: i}
    end
  end

  # returns an array of hashes for each recipe
  def self.scrape_recipes(category_url)
    doc = Nokogiri::HTML(open(category_url))
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
  end

  def self.scrape_recipe(recipe_url)
  end

end
