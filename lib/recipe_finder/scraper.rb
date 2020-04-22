class RecipeFinder::Scraper

  # returns an array of hashes for each category
  def self.scrape_categories(website)
    doc = Nokogiri::HTML(open(website))
    doc.css(".grid-col--subnav").map do |el|
      {name: el.css("span.category-title").text,
      url: el.attr("href"),
      recipes: []}
    end
  end


end
