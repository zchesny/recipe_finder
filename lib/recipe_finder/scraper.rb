class RecipeFinder::Scraper

  def self.scrape_categories
    doc = Nokogiri::HTML(open("https://www.allrecipes.com/"))
    binding.pry
    # categories = doc.search("span.category-title").children.map{|el| el.text}
    # urls = doc.css(".grid-col--subnav").map{|el| el.attr("href")}
    doc.css(".grid-col--subnav").map do |el|
      {name: el.css("span.category-title").text,
      url: el.attr("href"),
      recipes: []}
    end
    # doc.search("span.category-title").children.map do |el|
    #   {name: el.text,
    #     url: "me",
    #     recipes: []
    #   }
    # end
  end


end
