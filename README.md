# CuratedDeals
This Ruby Gem includes a CLI that provides the user with a list of product categories; users can then select from this list to view specific items available for purchase on Amazon.com

## Installation
Please make sure to install homebrew, follow instructions from this link https://docs.brew.sh/Installation.html

Then install Google Chrome: chromedriver

    $ brew install chromedriver

To install gem:

Add this line to your application's Gemfile:

```ruby
gem 'curated_deals'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install curated_deals

## Usage

To use, run ./bin/curated_deals on your command line. Choose the category of products you would like to see by typing their corresponding number. This will display a list of items from which you can also choose by typing their assigned number. After you make your choice, an Amazon.com window will launch displaying your selected item. Products you can actually buy!!

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nettymaza/curated_deals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
