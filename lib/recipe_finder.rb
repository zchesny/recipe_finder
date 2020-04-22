# This file acts as an environment: the single file that
# recipe-finder will require and then it will require all the other dependencies
# Require version
require 'open-uri' # part of standard lib, so don't need to require it with the gem spec
require 'nokogiri'
require 'colorize'
require 'pry'

require_relative '../lib/recipe_finder/version'
require_relative '../lib/recipe_finder/cli'
require_relative '../lib/recipe_finder/scraper'
require_relative '../lib/recipe_finder/category'
require_relative '../lib/recipe_finder/recipe'
