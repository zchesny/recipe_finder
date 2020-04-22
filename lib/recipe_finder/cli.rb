# Our CLI Controller
class RecipeFinder::CLI

  BASE_PATH = "https://www.allrecipes.com/"

  # def run
  #   make_students
  #   add_attributes_to_students
  #   display_students
  # end
  #

  #
  # def add_attributes_to_students
  #   Student.all.each do |student|
  #     attributes = Scraper.scrape_profile_page(BASE_PATH + student.profile_url)
  #     student.add_student_attributes(attributes)
  #   end
  # end
  #
  # def display_students
  #   Student.all.each do |student|
  #     puts "#{student.name.upcase}".colorize(:blue)
  #     puts "  location:".colorize(:light_blue) + " #{student.location}"
  #     puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
  #     puts "  bio:".colorize(:light_blue) + " #{student.bio}"
  #     puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
  #     puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
  #     puts "  github:".colorize(:light_blue) + " #{student.github}"
  #     puts "  blog:".colorize(:light_blue) + " #{student.blog}"
  #     puts "----------------------".colorize(:green)
  #   end
  # end

  def call
    make_categories
    list_categories
    menu
    goodbye
  end

  def make_categories
    category_array = RecipeFinder::Scraper.scrape_categories(BASE_PATH)
    RecipeFinder::Category.create_from_collection(category_array)
  end

  def list_categories
    puts "Categories:"
    RecipeFinder::Category.list
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the recipe category you'd like more info on or type 'list' to see the categories again or type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        the_category = @categories[input.to_i - 1]
        puts "DETAILS #{the_category.name}"
      elsif input == "list"
        list_recipe_categories
      else
        puts "Not sure what you want, type 'list' or 'exit'"
      end

    end
  end

  def goodbye
    puts "See you tomorrow for more recipes!!!"
  end
end
