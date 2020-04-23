# RecipeFinder

This is a command line interface Ruby Gem that explores categories and recipes from the [AllRecipes website](https://www.allrecipes.com/).
It allows the user to search through categories and select a recipe to find out a description, ingredients, directions, and more!
It retrieves the most up-to-date Top 10 Most Made Today Recipes from each of the listed categories.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recipe_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recipe_finder

## Usage

To run this gem, clone or download this repo and run: `./bin/recipe-finder`

### Recommended Steps:

1. You will be greeted with a Main Menu. Enter 'help' to see your options.
2. Enter 'list' to see the Recipe Categories.
3. Enter 'cook' to select a Recipe Category. Follow the prompts on the screen.
4. Enter 'help' to learn the new options from this Category Menu.
5. Enter 'cook' to select a Recipe. Follow the prompts on the screen.
6. Enter 'quit' to exit the program.

**NOTE** From the Main Menu, you may enter: 'help', 'cook', 'list', or 'quit'.
From a Category Menu, you may enter: 'help', 'cook', 'list', 'back', or 'quit'.
If your entry is invalid, you will be prompted for a new one. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'zchesny'/recipe_finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RecipeFinder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'zchesny'/recipe_finder/blob/master/CODE_OF_CONDUCT.md).
