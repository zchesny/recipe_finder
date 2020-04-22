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


end
