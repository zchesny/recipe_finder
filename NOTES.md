How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with project structure - google
3. Start with the entry point - the file run
  - Start programming from where the user will interact with it
  - The executable
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- A command line interface for finding recipes (allrecipes)

user types in recipe_finder

Show a list of recipe categories

1. Quarantine Cooking
2. Appetizers and Snacks
...
10. Slow Cooker Recipes
11. Soups, Stews, and Chili

Which recipe category would you like to search?

1

Steps:
1. Create recipe-finder in ./bin folder
2. chmod +x recipe-finder
3. ./bin/recipe-finder
4. Set up bin file with RecipeFinder::CLI.new.call
5. Move on and discover new objects; don't edit bin file much more
6. Start writing call in RecipeFinder::CLI class
- fake the data
- you just want to get it working so that you can move on and leave the harder tasks like scraping until later

What is a category?
- A category has a name
- A category contains 4 "Most Made Today" recipes
- A category has a url

What is a recipe?
- A recipe has a name
- A recipe has an author
- A recipe has a rating (stars)
- A recipe has a quote (?)
- A recipe has ingredients
- A recipe has directions
- A recipe has prep time
- A recipe has cook time
- A recipe has total time ("ready in")
- A recipe has nutrition facts
- A recipe has a url 
