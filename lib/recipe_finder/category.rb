class RecipeFinder::Category

  attr_accessor :name, :url, :recipes

  @@all = []

  def self.list
    self.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def initialize(category_hash)
    category_hash.each{|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end

  def self.create_from_collection(category_array)
    category_array.each{|category_hash| self.new(category_hash)}
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
