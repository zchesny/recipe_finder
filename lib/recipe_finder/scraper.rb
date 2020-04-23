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
        rating: el.css("div.rating-stars span.stars").attr("aria-label").value,
        url: el.search("a").attr("href").value,
        index: i}
    end
    recipes
  end

  def self.scrape_recipe(recipe_url)
    doc = Nokogiri::HTML(open(recipe_url))
    # looks like there are two versions of the html
    if doc.css("span.author-name").text.strip != ""
      {
        author: doc.css("span.author-name").text.strip,
        description: doc.css("p.margin-0-auto").text.strip,
        ingredients: doc.css("ul.ingredients-section li").map{|el| el.css("span.ingredients-item-name").text.strip},
        directions: doc.css("ul.instructions-section li").map{|el| el.css("div.section-body p").text.strip},
        nutrition: doc.css("div.recipe-nutrition-section div.section-body").text.strip.gsub(/\s{5}/, "").gsub("Full Nutrition", "").strip
      }
    elsif doc.css("span.submitter__name").text.strip != ""
      {
        author: doc.css("span.submitter__name").text.strip,
        description: doc.css("div.submitter__description").text.strip,
        ingredients: doc.css("ul#lst_ingredients_1 li.checkList__line").map{|el| el.css("span.recipe-ingred_txt").text.gsub("Watch Now", "").strip}.reject(&:empty?),
        directions: doc.css("span.recipe-directions__list--item").map{|el| el.text.strip},
        nutrition: "unavailable"
      }
    else {
      author: "unavailable",
      description: "unavailable",
      ingredients: "unavailable",
      directions: "unavailable",
      nutrition: "unavailable"
    }

    end
  end

end
