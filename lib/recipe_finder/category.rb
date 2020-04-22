class RecipeFinder::Category

  attr_accessor :name, :recipes, :url

  def self.list
    # I should return a list of recipe categories
    # here doc - giant strings
    # scrape allrecipes and then return categories based on that data
    self.scrape_categories
    #RecipeFinder::Scraper.new.categories


  end

  def self.scrape_categories
    categories = []
    # Go to allrecipes, find the scrape_categories
    # Extract the category names
    # Instantiate a category


    categories


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

  def self.scrape_allrecipes
    doc = Nokogiri::HTML(open("https://www.allrecipes.com/"))
    binding.pry
    categories = doc.search("span.category-title").children.map{|el| el.text}
    urls = doc.css(".grid-col--subnav").map{|el| el.attr("href")}
    # url: doc.search("div #insideScroll").search("ul li").children
    # deal.url = doc.search("a.wantone").first.attr("href").strip
    # works: doc.search("div #insideScroll").search("ul li").search("a").attr("href").value
    # works: doc.search("div #insideScroll").search("ul").search("li a").attr("href").value
    #  ms = doc.css(".grid-col--subnav")
    # ms.each{|el| el.attr("href")}
  end

end
